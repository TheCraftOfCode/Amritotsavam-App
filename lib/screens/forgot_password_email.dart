import 'dart:convert';

import 'package:amritotsavam_app/screens/forgot_password_change.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

class ForgotPasswordEmailField extends StatefulWidget {
  const ForgotPasswordEmailField({Key? key}) : super(key: key);

  @override
  _ForgotPasswordEmailFieldState createState() =>
      _ForgotPasswordEmailFieldState();
}

class _ForgotPasswordEmailFieldState extends State<ForgotPasswordEmailField> {
  String error = "";
  final _formKey = GlobalKey<FormFieldState>();
  final _emailController = TextEditingController();
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: constants.gradientDecoration,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Send verification key to your email ID to reset your password',
                    style: GoogleFonts.nunito(
                      color: colors.primaryTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter E-Mail";
                      } else if (!EmailValidator.validate(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                    key: _formKey,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text('Email',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Please enter your amrita email id',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
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
                padding: constants.textFieldPadding,
                child: error == "" ? Container() : errorBox(error),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: showProgress
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                showProgress = true;
                              });
                              var res = await makePostRequest(
                                  json.encode({
                                    "email": _emailController.text,
                                  }),
                                  "/forgotPassword",
                                  null,
                                  false);
                              setState(() {
                                showProgress = false;
                              });
                              if (res.statusCode == 200) {
                                showToast("Verification ID has been sent!");
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordChange(
                                                email: _emailController.text)));
                              } else {
                                setState(() {
                                  error = json.decode(res.body)['message'];
                                });
                              }
                            }
                          },
                          child: Text(
                            'SEND VERIFICATION KEY',
                            style:
                                GoogleFonts.nunito(fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
