import 'package:amritotsavam_app/screens/home_page.dart';
import 'package:amritotsavam_app/utils/theme.dart';
import 'package:amritotsavam_app/widgets/load_valid_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'screens/welcome_page.dart';

//TODO: Change Icons in each tiles in home page
//TODO: Fill about pages
//TODO: Add widget to generate list
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notifications.',
//     // description
//     importance: Importance.max,
//   );
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   print("Handling a background message: ${message.messageId}");
//   print(message.data);
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   if (notification != null && android != null) {
//     flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: android.smallIcon,
//           ),
//         ));
//   }
// }

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Firebase.initializeApp();
  //
  // final FirebaseMessaging messaging = FirebaseMessaging.instance;
  // messaging.getToken().then((value) {
  //   print(value);
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  //
  // const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //   'high_importance_channel', // id
  //   'High Importance Notifications', // title
  //   description: 'This channel is used for important notifications.',
  //   // description
  //   importance: Importance.max,
  // );
  //
  // messaging.subscribeToTopic('main');
  //
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  //
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // var initializationSettingsAndroid =
  //     const AndroidInitializationSettings('@mipmap/ic_launcher');
  // var initializationSettingsIOS = const IOSInitializationSettings();
  // var initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print(message.data);
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if (notification != null && android != null) {
  //     flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channelDescription: channel.description,
  //             icon: android.smallIcon,
  //           ),
  //         ));
  //   }
 // });

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme.darkTheme,
      home: const LoadValidPageWidget(WelcomePage(), HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}





//TODO: Change home page nav bar
//TODO: Dialogue asking lose changes blah blah using alert_dialog widget
//TODO: Add progress wheels for buttons
