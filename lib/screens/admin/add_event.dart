import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);


  @override
  _AddEvent createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(height: 60,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Add Event',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              //TODO: Find out user model and collect relevant details
            ],
          ),
        ),
      ),
    );
  }
}
