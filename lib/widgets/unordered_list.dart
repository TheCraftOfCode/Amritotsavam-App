import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {Key? key}) : super(key: key);
  final List? texts;


  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts!) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Enable if bullets needed
        // Text("• ", style: GoogleFonts.nunito(color: colors.primaryTextColor)),
        Expanded(
          child: SelectableText(
            text,
            style: GoogleFonts.nunito(color: colors.primaryTextColor),
          ),
        ),
      ],
    );
  }
}
