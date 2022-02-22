import 'package:amritotsavam_app/screens/home_page.dart';
import 'package:amritotsavam_app/screens/result_page.dart';
import 'package:amritotsavam_app/widgets/event_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;



class ResultsHomePage extends StatefulWidget {
  const ResultsHomePage({Key? key}) : super(key: key);

  @override
  _ResultsHomePageState createState() => _ResultsHomePageState();
}

class _ResultsHomePageState extends State<ResultsHomePage> {

  final listUpcoming = ["EVENT", "EVENT", "EVENT", "EVENT", "EVENT", "EVENT"];
  final listRSVP = ["EVENT", "EVENT", "EVENT", "EVENT", "EVENT", "EVENT"];
  final allEventsList = ["Event", "Event", "Event", "Event", "Event", "Event"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 40,),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 20, left: 30),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Results',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Click on an event to find out more',
                            style: GoogleFonts.nunito(
                            fontSize: 17,
                            color: colors.primaryTextColor,),)
                      ],
                    )),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allEventsList.length,
                itemBuilder: (_, i) {
                  return MainContentCardWidget(
                    cardTitle: 'Some Festival Name Here',
                    cardSubTitle: 'This is some festival on some date',
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ResultPage(List<>)));
                    }, cardDate: 'date',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

