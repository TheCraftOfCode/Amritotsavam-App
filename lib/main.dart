import 'package:amritotsavam_app/screens/home_page.dart';
import 'package:amritotsavam_app/screens/login_page.dart';
import 'package:amritotsavam_app/screens/signup_page.dart';
import 'package:amritotsavam_app/utils/theme.dart';
import 'package:amritotsavam_app/widgets/load_valid_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'screens/welcome_page.dart';
import 'package:amritotsavam_app/utils/theme.dart';

//TODO: Add logic to validate JWT and switch between WelcomePage and Home Page

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const OKToast(
    position: ToastPosition.center,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme.DarkTheme,
      //home: const LoadValidPageWidget(WelcomePage(), HomePage()),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//TODO: Add forgot password
//TODO: Re-enable verification
//TODO: Redesign login, sign up
//TODO: Change color scheme
//TODO: ExpansionPanel add
//TODO: Change home page nav bar
//TODO: Add admin console
//TODO: