import 'package:amritotsavam_app/screens/login_page.dart';
import 'package:amritotsavam_app/screens/signup_page.dart';
import 'package:amritotsavam_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

//TODO: Style externally in ThemeData
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 76, 11, 255),
              Color.fromARGB(255, 3, 185, 255),
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: const Text("REPLACE LOGO")),
              Center(child: const Text("REPLACE CAPTION")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    title: 'Login'
                  ),
                  GradientButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    title: 'Sign Up'
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
