import 'package:amritotsavam_app/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Widget> getProfilePicture(PeopleData data) async {
  try {
    await rootBundle.load(data.getImageDestination());
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        data.getImageDestination(),
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  } catch (_) {
    print(data.pictureURL);
    try {
      if (data.pictureURL != null) {
        await rootBundle.load(data.pictureURL!);
        return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            data.pictureURL!,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        );
      }
    } catch (_) {}
  }
  return CircleAvatar(
      backgroundColor: colors.activeCardColor,
      maxRadius: 40,
      child: Text(
        data.name[0],
        style: const TextStyle(fontSize: 35),
      ));
}

Widget userCard(PeopleData data) {
  return FutureBuilder(
      future: getProfilePicture(data),
      builder: (context, AsyncSnapshot snap) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: colors.inactiveCardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: snap.data ?? Container()),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name,
                            style: GoogleFonts.nunito(
                                fontSize: 17,
                                color: colors.primaryTextColor,
                                fontWeight: FontWeight.bold)),
                        if (data.rollNo != "" && data.rollNo != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(data.rollNo ?? "",
                                style: GoogleFonts.nunito(
                                    fontSize: 17,
                                    color: colors.primaryTextColor
                                        .withOpacity(0.7))),
                          ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                alignment: Alignment.centerLeft),
                            onPressed: () async {
                              await launch("tel://+91${data.phoneNo}");
                            },
                            child: Text(data.phoneNo,
                                style: GoogleFonts.nunito(
                                    fontSize: 17,
                                    color: colors.primaryTextColor
                                        .withOpacity(0.7))))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
