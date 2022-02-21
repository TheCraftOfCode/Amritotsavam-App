import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublishResults extends StatefulWidget {
  @override
  State<PublishResults> createState() => _PublishResultsState();
}

class _PublishResultsState extends State<PublishResults> {
  final List<String> _events = ['event-1', 'event-2', 'event-3', 'event-4'];

  final List<String> _houses = [
    'Amritamayi',
    'Anandamayi',
    'Chinmayi',
    'Jyothirmayi'
  ];

  bool brave = false;

  //Event Identifiers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: constants.gradientDecoration,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Results (admin)',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: DropDownFormField(
                  title: 'Choose Event',
                  list: _events,
                  hint: 'Please choose event',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                      return alert;}
                      );
                  },
                  child: Text(
                    'CONTINUE',
                    style: GoogleFonts.nunito(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: Text(
                  '1st place',
                  style: GoogleFonts.nunito(
                      color: colors.primaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full name',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Roll No',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full roll no',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              DropDownFormField(
                  list: _houses, title: 'House', hint: 'Pick the house'),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  '2nd place',
                  style: GoogleFonts.nunito(
                      color: colors.primaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full name',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Roll No',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full roll no',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              DropDownFormField(
                  list: _houses, title: 'House', hint: 'Pick the house'),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  '3rd place',
                  style: GoogleFonts.nunito(
                      color: colors.primaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full name',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextFormField(
                    //controller:
                    style: GoogleFonts.nunito(color: colors.primaryTextColor),
                    decoration: InputDecoration(
                      label: Text(
                        'Roll No',
                        style: GoogleFonts.raleway(
                            color: colors.textBoxTextColor, fontSize: 15),
                      ),
                      filled: true,
                      hintText: 'Please enter full roll no',
                      hintStyle: GoogleFonts.poppins(
                          color: colors.primaryTextColor.withOpacity(0.7)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      fillColor: colors.textBoxFill,
                      focusColor: colors.textBoxFill,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              DropDownFormField(
                  list: _houses, title: 'House', hint: 'Pick the house'),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    child: Text('CONTINUE',style: GoogleFonts.nunito(color: colors.primaryTextColor,fontWeight: FontWeight.bold,fontSize: 17),),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return finalAlert;
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  AlertDialog alert = AlertDialog(
    title: Text("Wait!"),
    content: Text(
        "Once entered, results cannot be modified. Are you sure you want to proceed?"),
    actions: [
      TextButton(
        child: Text("Cancel"),
        onPressed: () {},
      ),
      TextButton(
        child: Text("Continue"),
        onPressed: () {},
      ),
    ],
  );

  AlertDialog finalAlert = AlertDialog(
    title: Text("Publish?"),
    content: Text(
        "Once entered, results cannot be modified."),
    actions: [
      TextButton(
        child: Text("Cancel"),
        onPressed: () {},
      ),
      TextButton(
        child: Text("Continue"),
        onPressed: () {},
      ),
    ],
  );
}
