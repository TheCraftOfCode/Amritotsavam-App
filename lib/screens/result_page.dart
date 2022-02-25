import 'package:amritotsavam_app/models/results_model.dart';
import 'package:amritotsavam_app/widgets/result_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class ResultPage extends StatefulWidget {
  final List<ResultsModel>? results;

  const ResultPage({Key? key, this.results}) : super(key: key);

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
            Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Results',
                    style: GoogleFonts.nunito(
                        fontSize: 30,
                        color: colors.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    ResultCard(
                        widget.results![0].name,
                        'assets/svg/first_place.svg',
                        widget.results![0].rollNumber,
                        widget.results![0].house,
                        colors.firstPlaceColor,
                        colors.firstPlaceTextColor),
                    Container(
                      height: 20,
                    ),
                    ResultCard(
                        widget.results![1].name,
                        'assets/svg/second_place.svg',
                        widget.results![1].rollNumber,
                        widget.results![1].house,
                        colors.secondPlaceColor,
                        colors.secondPlaceTextColor),
                    Container(
                      height: 20,
                    ),
                    ResultCard(
                        widget.results![2].name,
                        'assets/svg/third_place.svg',
                        widget.results![2].rollNumber,
                        widget.results![2].house,
                        colors.thirdPlaceColor,
                        colors.thirdPlaceTextColor),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
