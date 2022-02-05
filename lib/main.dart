import 'package:amritotsavam_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/welcome_page.dart';
import 'package:amritotsavam_app/utils/theme.dart';

//TODO: Add logic to validate JWT and switch between WelcomePage and Home Page

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme.DarkTheme,
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

