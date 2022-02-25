import 'package:amritotsavam_app/utils/data.dart';
import 'package:amritotsavam_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class ElectedRepresentatives extends StatelessWidget {
  const ElectedRepresentatives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        height: double.maxFinite,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20, left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Elected Representatives',
                    style: GoogleFonts.nunito(
                        fontSize: 30,
                        color: colors.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,       //TODO: Find logic for displaying category wise
                itemBuilder: (_, i) {
                  return userCard(multimediaTeam[i]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
