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
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 30),
                child: Text(
                  'Cultural Central Coordinators',
                  style: GoogleFonts.nunito(
                      fontSize: 25,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: centralCoordinatorsCultural.length,
                itemBuilder: (_, i) {
                  return userCard(centralCoordinatorsCultural[i]);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 30),
                child: Text(
                  'House Representatives',
                  style: GoogleFonts.nunito(
                      fontSize: 25,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //AMRITAMAYI
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'AMRITAMAYI',
                  style: GoogleFonts.nunito(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["sec"]![0]),
              userCard(electedRepresentatives["girls"]!["sec"]![0]),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'JOINT SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["joint_sec"]![0]),
              userCard(electedRepresentatives["girls"]!["joint_sec"]![0]),

              //Second one
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'ANANDAMAYI',
                  style: GoogleFonts.nunito(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["sec"]![1]),
              userCard(electedRepresentatives["girls"]!["sec"]![1]),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'JOINT SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["joint_sec"]![1]),
              userCard(electedRepresentatives["girls"]!["joint_sec"]![1]),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'CHINMAYI',
                  style: GoogleFonts.nunito(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["sec"]![2]),
              userCard(electedRepresentatives["girls"]!["sec"]![2]),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'JOINT SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["joint_sec"]![2]),
              userCard(electedRepresentatives["girls"]!["joint_sec"]![2]),


              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'JYOTHIRMAYI',
                  style: GoogleFonts.nunito(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["sec"]![3]),
              userCard(electedRepresentatives["girls"]!["sec"]![3]),

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'JOINT SECRETARY',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: colors.primaryTextColor.withOpacity(0.7)),
                ),
              ),
              userCard(electedRepresentatives["boys"]!["joint_sec"]![3]),
              userCard(electedRepresentatives["girls"]!["joint_sec"]![3]),
            ],
          ),
        ),
      ),
    );
  }
}
