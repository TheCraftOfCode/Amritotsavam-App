import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultCard extends StatefulWidget {
  const ResultCard(this.position, this.imageUrl, this.rollNo, this.house, this.color, this.textColor, {Key? key}) : super(key: key);

  final String position;
  final String imageUrl;
  final String rollNo;
  final String house;
  final Color color;
  final Color textColor;
  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
      color: widget.color,
      boxShadow: const [
        BoxShadow(
          color: Color(0xBC000000),
          blurRadius: 5.0,
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AutoSizeText(widget.position,
                    maxLines: 3,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: widget.textColor)),
                AutoSizeText(widget.rollNo,
                    maxLines: 3,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: widget.textColor)),
                Container(height: 10,),
                AutoSizeText(widget.house,
                    maxLines: 3,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: widget.textColor)),
              ],
            ),
          ),
          flex: (widget.position.length>15) ? 3: 2,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(widget.imageUrl),
          ),
          flex: 1,
        ),
      ],
    ),);
  }
}
