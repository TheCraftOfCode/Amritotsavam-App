import 'package:amritotsavam_app/widgets/result_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {


  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: constants.gradientDecoration,
          child: Column(
            children: [
              Container(height: 50,),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 20, left: 30),
                child: Align(
                    alignment: Alignment.topLeft,
                    child:                         Text(
                          'Results',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                    )),
              Padding(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  ResultCard('First', 'assets/svg/first_place.svg', 'CB.EN.U4CSE19038','AMRITAMAYI', colors.firstPlaceColor, colors.firstPlaceTextColor),
                  Container(height: 20,),
                  ResultCard('Second', 'assets/svg/second_place.svg', 'CB.EN.U4CSE19038','ANANDAMAYI', colors.secondPlaceColor, colors.secondPlaceTextColor),
                  Container(height: 20,),
                  ResultCard('Third', 'assets/svg/third_place.svg', 'CB.EN.U4CSE19038','CHINMAYI', colors.thirdPlaceColor, colors.thirdPlaceTextColor),
                ],
              ))
            ],
          ),
        ),
    );
  }
}
