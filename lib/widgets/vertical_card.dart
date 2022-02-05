import 'package:flutter/material.dart';

class VerticalCard extends StatefulWidget {
  const VerticalCard(
      {Key? key,
      required this.route,
      required this.title,
      required this.svgLocation,
      required this.gradientStartingColor,
      required this.gradientEndingColor})
      : super(key: key);

  final MaterialPageRoute route;
  final String title;
  final String svgLocation;
  final Color gradientStartingColor;
  final Color gradientEndingColor;

  @override
  _VerticalCardState createState() => _VerticalCardState();
}

class _VerticalCardState extends State<VerticalCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
