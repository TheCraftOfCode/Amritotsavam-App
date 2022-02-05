import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class darkTheme {
  static ThemeData get DarkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: colors.scaffoldColor,
      iconTheme: IconThemeData(color: colors.primaryTextColor),
      appBarTheme: const AppBarTheme(
          elevation: 0, backgroundColor: Colors.transparent, centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.textFieldColor,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(7.0),
        labelStyle: GoogleFonts.nunito(color: colors.primaryTextColor),
        floatingLabelStyle:
        GoogleFonts.nunito(color: colors.primaryTextColor),
        hintStyle: GoogleFonts.nunito(color: colors.primaryTextColor),
      ),
      buttonTheme: ButtonThemeData(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          buttonColor: colors.primaryTextColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colors.primaryTextColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            textStyle: MaterialStateProperty.all(GoogleFonts.nunito(color: colors.accentColor)),
          )),
    );
  }
}