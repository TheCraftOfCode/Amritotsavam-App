import 'dart:convert';

import 'package:amritotsavam_app/screens/signup_page.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:amritotsavam_app/widgets/password_widget.dart';
import 'package:amritotsavam_app/widgets/rounded_button.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  MaterialPageRoute signUpRoute =
      MaterialPageRoute(builder: (context) => const SignUpPage());

  String error = "";
  bool showProgress = false;

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
                    "LOGIN",
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
                        key: _emailKey,
                        controller: _emailController,
                        textAlign: TextAlign.start,
                        style:
                            GoogleFonts.nunito(color: colors.primaryTextColor),
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Please enter User-ID / E-Mail";
                          } else if (!EmailValidator.validate(value)) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text("User-ID / E-Mail"),
                            hintText: "Enter your username / e-mail here"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: PasswordFormFieldWidget(
                          passwordKey: _passwordKey,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Please enter password";
                            } else {
                              return null;
                            }
                          },
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor),
                          label: "Password",
                          hintText: "Enter your password",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: ErrorBox(error),
                      ),
                      showProgress
                          ? const CircularProgressIndicator()
                          : RoundedButton(
                              onPressed: () async {
                                setState(() {
                                  error = "";
                                });
                                bool emailBool =
                                    _emailKey.currentState!.validate();
                                bool passwordBool =
                                    _passwordKey.currentState!.validate();
                                if (emailBool && passwordBool) {
                                  setState(() {
                                    showProgress = true;
                                  });
                                  var res = await makePostRequest(
                                      json.encode({
                                        "email": _emailController.text,
                                        "password": _passwordController.text
                                      }),
                                      "/login",
                                      null,
                                      false);
                                  setState(() {
                                    showProgress = false;
                                  });
                                  if (res.statusCode == 200) {
                                    jwtTokenSet = res.body;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  } else {
                                    setState(() {
                                      error = res.body;
                                    });
                                  }
                                }
                              },
                              title: 'LOGIN'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
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
                                    builder: (context) => const SignUpPage()));
                          },
                          child: Text(
                            'Sign up',
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
