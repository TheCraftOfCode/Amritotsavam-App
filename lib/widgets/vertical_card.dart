import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class VerticalCard extends StatefulWidget {
  const VerticalCard(
      {Key? key,
      required this.route,
      required this.title,
      required this.svgLocation,
      required this.gradientStartingColor,
      required this.textAlign,
      required this.fontSize,
      required this.gradientEndingColor})
      : super(key: key);

  final MaterialPageRoute route;
  final String title;
  final String svgLocation;
  final Color gradientStartingColor;
  final Color gradientEndingColor;
  final TextAlign textAlign;
  final fontSize;

  @override
  _VerticalCardState createState() => _VerticalCardState();
}

//TODO: Change Color? Add icon and change Text to AutoText thingey?
class _VerticalCardState extends State<VerticalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          semanticContainer: true,
          child: Material(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                widget.gradientStartingColor,
                widget.gradientEndingColor
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: InkWell(
                onTap: (){},
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO: Add SVG based on event category
                          Text(
                            widget.title,
                            textAlign: widget.textAlign,
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: widget.fontSize.toDouble(),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(widget.route);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          elevation: 5,
        ));
  }
}
