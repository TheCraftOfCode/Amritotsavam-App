import 'dart:convert';

import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:amritotsavam_app/widgets/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangeName> {
  String error = "";
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();

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
                    hintText: 'Please enter your old password',
                    label: 'Old Password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: PasswordFormFieldWidget(
                    hintText: 'Please enter your new password',
                    label: 'New Password',
                    controller: _newPasswordController,
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
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
                                "newPassword": _newPasswordController.text,
                                "currentPassword": _passwordController.text
                              }),
                              "/changePassword",
                              null,
                              true);
                          setState(() {
                            //showProgress = false;
                          });
                          if (res.statusCode == 200) {
                            jwtTokenSet = json.decode(res.body)['token'];
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              error = json.decode(res.body)['message'];
                            });
                          }
                        }
                      },
                      child: Text(
                        'CHANGE PASSWORD',
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
