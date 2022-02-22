import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        decoration: constants.gradientDecoration,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20, left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Profile',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        )
    ));;
  }
}
