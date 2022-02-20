import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;



class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: constants.gradientDecoration,
    );
  }
}
