import 'package:amritotsavam_app/utils/data.dart';
import 'package:amritotsavam_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class FacultyCoordinators extends StatelessWidget {
  const FacultyCoordinators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var data in facultyCoordinators) {
      widgetList.add(Expanded(child: userCard(data)));
    }

    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 20, left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Faculty Coordinators',
                  style: GoogleFonts.nunito(
                      fontSize: 30,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: widgetList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
