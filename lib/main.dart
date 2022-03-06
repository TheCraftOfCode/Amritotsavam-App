import 'dart:convert';
import 'dart:io';

import 'package:amritotsavam_app/screens/home_page.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/theme.dart';
import 'package:amritotsavam_app/widgets/alert_dialog.dart';
import 'package:amritotsavam_app/widgets/load_valid_page_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oktoast/oktoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();

  runApp(const OKToast(
    position: ToastPosition.center,
    child: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  checkUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var res = await makePostRequest(null, "/checkUpdate", null, true,
        context: navigatorKey.currentContext);
    var decodedVal = json.decode(res.body)['update'][0];
    if (packageInfo.version != decodedVal['versionNumber']) {
      displayDialog(navigatorKey.currentContext, "Update", null, () async {
        if (!await launch(decodedVal['updateLink'])) {
          throw 'Could not launch url';
        }
        exit(0);
      }, "Update app",
          "A new update is available to version ${decodedVal['versionNumber']}! Please update to avoid instabilities in application",
          dismissDialog: false, willPop: false);
    }
  }

  Future<void> initNotification() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'amritotsavam_notification_channel', // id
      'Amritotsavam Notifications', // title
      description: 'This channel is used for amritotsavam notifications.',
      // description
      importance: Importance.max,
    );

    messaging.subscribeToTopic('main');

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        if (notification.title == "Update") {
          if (navigatorKey.currentContext != null) {
            if (packageInfo.version != message.data['version']) {
              displayDialog(navigatorKey.currentContext, "Update", null,
                  () async {
                if (!await launch(message.data['updateLink'])) {
                  throw 'Could not launch url';
                }
                exit(0);
              }, "Update app",
                  "A new update is available to version ${message.data['version']}! Please update to avoid instabilities in application",
                  dismissDialog: false, willPop: false);
            }
          }
        }
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
              ),
            ));
      }
    });
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    checkUpdate();
    initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme.darkTheme,
      navigatorKey: navigatorKey,
      home: const LoadValidPageWidget(WelcomePage(), HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

//TODO: Dialogue asking lose changes blah blah using alert_dialog widget
