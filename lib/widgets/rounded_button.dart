import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final Function()? onPressed;
  final String title;

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              widget.title,
              style: GoogleFonts.nunito(
                  color: colors.accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }
}
