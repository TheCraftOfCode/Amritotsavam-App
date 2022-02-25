import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class VerticalCard extends StatefulWidget {
  const VerticalCard(
      {Key? key,
      required this.title,
      required this.svgLocation,
      required this.gradientStartingColor,
      required this.textAlign,
      required this.fontSize,
      required this.route,
      required this.gradientEndingColor})
      : super(key: key);

  final String title;
  final String svgLocation;
  final Color gradientStartingColor;
  final Color gradientEndingColor;
  final TextAlign textAlign;
  final Widget route;
  final fontSize;

  @override
  _VerticalCardState createState() => _VerticalCardState();
}

class _VerticalCardState extends State<VerticalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
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
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => widget.route));
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      textAlign: widget.textAlign,
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: widget.fontSize.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
