import 'package:amritotsavam_app/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

Widget userCard(PeopleData centralCoordinators){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
    color: colors.inactiveCardColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: colors.activeCardColor,
              maxRadius: 40,
              child: Text(
                centralCoordinators.name[0],
                style: const TextStyle(fontSize: 35),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(centralCoordinators.name,
                    style: GoogleFonts.nunito(
                        fontSize: 17,
                        color: colors.primaryTextColor,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                      centralCoordinators.rollNo ?? "",
                      style: GoogleFonts.nunito(
                          fontSize: 17,
                          color: colors.primaryTextColor
                              .withOpacity(0.7))),
                ),
                Text(centralCoordinators.phoneNo,
                    style: GoogleFonts.nunito(
                        fontSize: 17,
                        color: colors.primaryTextColor
                            .withOpacity(0.7)))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}