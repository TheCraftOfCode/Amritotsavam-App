import 'dart:convert';

import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:amritotsavam_app/widgets/password_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordChange extends StatefulWidget {
  const ForgotPasswordChange({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  _ForgotPasswordChange createState() => _ForgotPasswordChange();
}

class _ForgotPasswordChange extends State<ForgotPasswordChange> {
  String error = "";
  final _formKey = GlobalKey<FormState>();
  final _verificationKeyController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: constants.gradientDecoration,
          height: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter verification key and new password to change your password',
                      style: GoogleFonts.nunito(
                        color: colors.primaryTextColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: PasswordFormFieldWidget(
                    hintText: 'Please enter your verification key',
                    label: 'Verification Key',
                    controller: _verificationKeyController,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter verification key";
                      } else {
                        return null;
                      }
                    },
                    style: GoogleFonts.montserrat(color: colors.primaryTextColor),
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: PasswordFormFieldWidget(
                    hintText: 'Please enter your password',
                    label: 'Password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                    style: GoogleFonts.montserrat(color: colors.primaryTextColor),
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: error == "" ? Container() : ErrorBox(error),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var res = await makePostRequest(
                              json.encode({
                                "email": widget.email,
                                "forgotPasswordCode":
                                    _verificationKeyController.text,
                                "password": _passwordController.text
                              }),
                              "/forgotPasswordVerify",
                              null,
                              false);
                          setState(() {
                            //showProgress = false;
                          });
                          if (res.statusCode == 200) {
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              error = json.decode(res.body)['message'];
                            });
                          }
                        }
                      },
                      child: Text(
                        'SEND VERIFICATION KEY',
                        style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
