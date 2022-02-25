import 'package:amritotsavam_app/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget userCard(PeopleData centralCoordinators) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: colors.inactiveCardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(centralCoordinators.name,
                      style: GoogleFonts.nunito(
                          fontSize: 17,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold)),
                  if (centralCoordinators.rollNo != "" &&
                      centralCoordinators.rollNo != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(centralCoordinators.rollNo ?? "",
                          style: GoogleFonts.nunito(
                              fontSize: 17,
                              color: colors.primaryTextColor.withOpacity(0.7))),
                    ),
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          alignment: Alignment.centerLeft),
                      onPressed: () async {
                        await launch("tel://+91${centralCoordinators.phoneNo}");
                      },
                      child: Text(centralCoordinators.phoneNo,
                          style: GoogleFonts.nunito(
                              fontSize: 17,
                              color: colors.primaryTextColor.withOpacity(0.7))))
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
