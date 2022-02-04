import 'package:flutter/material.dart';

//TODO: Add styling
class GradientButton extends StatefulWidget {
  const GradientButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final Function()? onPressed;
  final String title;

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              widget.title,
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
