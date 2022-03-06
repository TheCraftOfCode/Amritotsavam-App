import 'dart:convert';

import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/alert_dialog.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class UpdateApp extends StatefulWidget {
  const UpdateApp({Key? key}) : super(key: key);

  @override
  State<UpdateApp> createState() => _UpdateAppState();
}

class _UpdateAppState extends State<UpdateApp> {
  final _formKey = GlobalKey<FormState>();
  final _versionController = TextEditingController();
  final _linkController = TextEditingController();
  String error = "";
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await displayQuitDialog(
            context, "Close Page?", "Are you sure you want to close this page? All data will be lost");
      },
      child: Scaffold(
        body: Container(
          decoration: constants.gradientDecoration,
          height: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 20, left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Update App',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      controller: _versionController,
                      style: GoogleFonts.montserrat(color: colors.primaryTextColor),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter version";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Update App Version',
                            style: GoogleFonts.raleway(
                                color: colors.textBoxTextColor, fontSize: 12)),
                        filled: true,
                        hintText: 'Please enter app version',
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
                  child: TextFormField(
                      controller: _linkController,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter link";
                        } else {
                          return null;
                        }
                      },
                      style: GoogleFonts.montserrat(color: colors.primaryTextColor),
                      decoration: InputDecoration(
                        label: Text('APK Link',
                            style: GoogleFonts.raleway(
                                color: colors.textBoxTextColor, fontSize: 12)),
                        filled: true,
                        hintText: 'Please enter update APK link',
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
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20, bottom: 20),
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
                          _formKey.currentState?.save();
                          setState(() {
                            showProgress = true;
                          });
                          var res = await makePostRequest(
                              json.encode({
                                "version": _versionController.text,
                                "link": _linkController.text
                              }),
                              "/appUpdates",
                              null,
                              true,
                              context: context);
                          setState(() {
                            showProgress = false;
                          });
                          if (res.statusCode == 200) {
                            error = '';
                            displayDialog(context, "Continue", null, () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }, "New Update has been published",
                                "New application update has been broadcast to all users");
                          } else {
                            setState(() {
                              error = json.decode(res.body)['message'];
                            });
                          }
                        }
                      },
                      child: Text(
                        'BROADCAST UPDATE',
                        style:
                        GoogleFonts.nunito(fontWeight: FontWeight.bold),
                      ),
                    ),
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
