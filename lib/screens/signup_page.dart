import 'dart:convert';

import 'package:amritotsavam_app/screens/sign_in.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/screens/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = "";
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: constants.gradientDecoration,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomSliverView(
              columnList: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                const Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Image(
                        image: AssetImage('assets/amritotsavam_logo.png')),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 80),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.nunito(
                              color: colors.primaryTextColor,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 50, top: 25, bottom: 10),
                        child: TextFormField(
                            controller: _nameController,
                            style: GoogleFonts.montserrat(
                                color: colors.primaryTextColor),
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Please enter name";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              label: Text('NAME',
                                  style: GoogleFonts.raleway(
                                      color: colors.textBoxTextColor,
                                      fontSize: 12)),
                              filled: true,
                              hintText: 'Please enter your name',
                              hintStyle: GoogleFonts.poppins(
                                  color:
                                      colors.primaryTextColor.withOpacity(0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: colors.textBoxFill,
                              focusColor: colors.textBoxFill,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 50, top: 15, bottom: 10),
                        child: TextFormField(
                            controller: _emailController,
                            style: GoogleFonts.montserrat(
                                color: colors.primaryTextColor),
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Please enter E-Mail";
                              } else if (!EmailValidator.validate(value)) {
                                return "Invalid Email";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              label: Text(
                                'EMAIL ADDRESS',
                                style: GoogleFonts.raleway(
                                    color: colors.textBoxTextColor,
                                    fontSize: 12),
                              ),
                              filled: true,
                              hintText: 'Please enter your email address',
                              hintStyle: GoogleFonts.poppins(
                                  color:
                                      colors.primaryTextColor.withOpacity(0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: colors.textBoxFill,
                              focusColor: colors.textBoxFill,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 50, top: 15, bottom: 10),
                        child: TextFormField(
                            controller: _passwordController,
                            style: GoogleFonts.montserrat(
                                color: colors.primaryTextColor),
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Please enter password";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              label: Text(
                                'PASSWORD',
                                style: GoogleFonts.raleway(
                                    color: colors.textBoxTextColor,
                                    fontSize: 12),
                              ),
                              filled: true,
                              hintText: 'Please enter your password',
                              hintStyle: GoogleFonts.poppins(
                                  color:
                                      colors.primaryTextColor.withOpacity(0.7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: colors.textBoxFill,
                              focusColor: colors.textBoxFill,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 50, top: 15, bottom: 10),
                        child: error == "" ? Container() : ErrorBox(error),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 20),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var res = await makePostRequest(
                                    json.encode({
                                      "name": _nameController.text,
                                      "email": _emailController.text,
                                      "password": _passwordController.text
                                    }),
                                    "/registerUser",
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
                                              const SignInPage()));
                                } else {
                                  setState(() {
                                    error = res.body;
                                  });
                                }
                              }
                            },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Container())
              ],
            ))
      ],
    );
  }
}
