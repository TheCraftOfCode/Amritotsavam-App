import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:amritotsavam_app/widgets/date_picker.dart';
import 'package:amritotsavam_app/widgets/dropdown_widget.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:amritotsavam_app/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEvent createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {
  final _eventNameController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _registrationLinkController = TextEditingController();
  final _submissionLinkController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = "";
  bool showProgress = false;
  final List<String> _eventType = [
    'FINE ARTS',
    'LITERARY',
    'DANCE',
    'MUSIC',
    'THEATRE',
    'INFORMALS'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        child: Form(
          key: _formKey,
          child: CustomSliverView(
            columnList: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20, left: 30),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Add Event',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Expanded(child: Container()),
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _eventNameController,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter event name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Event Name',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Enter event name',
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
              //TODO: Add Date Picker
              Padding(
                  padding: constants.textFieldPadding,
                  child: DatePickerWidget(context: context)),
              Padding(
                  padding: constants.textFieldPadding,
                  child: TimePickerWidget(context: context)),
              //TODO: Add Time Picker
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _eventLocationController,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter event location";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Event Location',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Enter event location',
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
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _registrationLinkController,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter registration URL";
                      } else {
                        RegExp regExp = RegExp(constants.urlPattern);
                        if (!(regExp.hasMatch(value))) {
                          return 'Please enter valid url';
                        }
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Registration URL',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Enter registration URL',
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
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _submissionLinkController,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter submission URL";
                      } else {
                        RegExp regExp = RegExp(constants.urlPattern);
                        if (!(regExp.hasMatch(value))) {
                          return 'Please enter valid url';
                        }
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Submission URL',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Enter submission URL',
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
                padding: constants.textFieldPadding,
                child: DropDownFormField(
                  list: _eventType,
                  title: 'Pick Event Type',
                  hint: 'Pick an appropriate event type',
                  onSaved: (data) {
                    print(data);
                    //roleData = data;

                    //TODO: Save
                  },
                ),
              ),
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    controller: _eventDescriptionController,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter event description";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      label: Text('Event Description',
                          style: GoogleFonts.raleway(
                              color: colors.textBoxTextColor, fontSize: 12)),
                      filled: true,
                      hintText: 'Enter event description',
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
                padding: constants.textFieldPadding,
                child: error == "" ? Container() : ErrorBox(error),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                      }
                    },
                    child: Text(
                      'CREATE EVENT',
                      style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
