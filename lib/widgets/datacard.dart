import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class DataCard extends StatelessWidget {
  DataCard(this.heading, this.imageUrl, this.route);

  final String heading;
  final String imageUrl;
  final Widget route;


  @override
  Widget build(BuildContext context) {
    return (Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: colors.dataCardColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0xBC000000),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              splashColor: const Color(0x7EFFFFFF),
              hoverColor: const Color(0xABFFFFFF),
              focusColor: const Color(0x86FFFFFF),
              highlightColor: const Color(0x3CFFFFFF),
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => route));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AutoSizeText(heading,
                                maxLines: 2,
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                    fontSize: (heading.length>15) ? 20 : 25,
                                    color: colors.primaryTextColor)),
                          ],
                        ),
                    ),
                    flex: (heading.length>1) ? 3: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(imageUrl),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      ),
    ));
  }
}
