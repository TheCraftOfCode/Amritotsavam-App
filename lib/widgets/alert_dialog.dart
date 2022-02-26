import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

displayDialog(context, positiveText, negativeText, Function positiveFunction,
    title, subTitle) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: colors.gradientEndColor,
      title: Text(
        title,
        style: GoogleFonts.raleway(
            color: colors.primaryTextColor, fontWeight: FontWeight.bold),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.raleway(color: colors.primaryTextColor),
      ),
      actions: <Widget>[
        negativeText != null
            ? TextButton(
                child: Text(
                  negativeText,
                  style: GoogleFonts.raleway(color: colors.primaryTextColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : Container(),
        ElevatedButton(
          child: Text(positiveText,
              style: TextStyle(color: colors.primaryTextColor)),
          onPressed: () async {
            positiveFunction();
          },
        ),
      ],
    ),
  );
}

displayQuitDialog(context, title, subTitle) async {
 return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: colors.gradientEndColor,
      title: Text(
        title,
        style: GoogleFonts.raleway(
            color: colors.primaryTextColor, fontWeight: FontWeight.bold),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.raleway(color: colors.primaryTextColor),
      ),
      actions: <Widget>[
        TextButton(
                child: Text(
                  "No",
                  style: GoogleFonts.raleway(color: colors.primaryTextColor),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
        ElevatedButton(
          child: Text("Yes",
              style: TextStyle(color: colors.primaryTextColor)),
          onPressed: () async {
            Navigator.pop(context, true);
          },
        ),
      ],
    ),
  );
}
