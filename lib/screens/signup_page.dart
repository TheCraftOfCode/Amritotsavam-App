import 'dart:convert';

import 'package:amritotsavam_app/screens/login_page.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:amritotsavam_app/widgets/password_widget.dart';
import 'package:amritotsavam_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//TODO: Complete Auth and replace TextFormField with Password widget
class _SignUpPageState extends State<SignUpPage> {
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
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomSliverView(
              columnList: [
                const Expanded(
                    flex: 6,
                    child: Center(child: Text("REPLACE ILLUSTRATION"))),
                Expanded(
                  flex: 2,
                  child: Text(
                    "SIGN UP",
                    style: GoogleFonts.nunito(
                        color: colors.primaryTextColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.start,
                        style:
                            GoogleFonts.nunito(color: colors.primaryTextColor),
                        decoration: const InputDecoration(
                            label: Text("User-ID / E-Mail"),
                            hintText: "Enter your username / e-mail here"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              label: Text("User Name"),
                              hintText: "Enter your Display name"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: PasswordFormFieldWidget(
                          label: "password",
                          hintText: "Enter your password",
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: PasswordFormFieldWidget(
                          label: "password",
                          hintText: "Enter your password again",
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor),
                        ),
                      ),
                      RoundedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          title: 'SIGN UP'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      //TODO: Figure out why ThemeData bodyText doesn't work
                      Text('New around here?',
                          style:
                              GoogleFonts.nunito(color: colors.primaryTextColor)
                          // darkTheme.DarkTheme.textTheme.bodyText1,
                          ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
                            'Login',
                            style:
                                GoogleFonts.nunito(color: colors.accentColor),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
