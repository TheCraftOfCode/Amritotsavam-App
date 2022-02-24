import 'dart:convert';

import 'package:amritotsavam_app/models/event_model.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:amritotsavam_app/widgets/date_picker.dart';
import 'package:amritotsavam_app/widgets/dropdown_widget.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:amritotsavam_app/widgets/string_list_generator.dart';
import 'package:amritotsavam_app/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key, required this.eventUpdate, required this.eventData})
      : super(key: key);
  final bool eventUpdate;
  final EventData eventData;

  @override
  _AddEvent createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {
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

  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

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
                      widget.eventUpdate ? 'Update Event' : 'Add Event',
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
                    initialValue: widget.eventData.eventName,
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter event name";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      widget.eventData.eventName = value!;
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
              Padding(
                  padding: constants.textFieldPadding,
                  child: DatePickerWidget(
                    defaultDate: widget.eventData.eventDate != ""
                        ? DateFormat("dd/MM/yyyy")
                            .parse(widget.eventData.eventDate)
                        : null,
                    context: context,
                    onSaved: (value) {
                      if(value != null) {
                        widget.eventData.eventDate =
                          DateFormat('dd/MM/yyyy').format(value);
                      }
                    },
                  )),
              Padding(
                  padding: constants.textFieldPadding,
                  child: TimePickerWidget(
                      initialValue: widget.eventData.time != ""
                          ? TimeOfDay.fromDateTime(DateFormat("h:mm a").parse(
                              widget.eventData.time,
                            ))
                          : null,
                      context: context,
                      onSaved: (value) {
                        widget.eventData.time = formatTimeOfDay(value!);
                      })),
              Padding(
                  padding: constants.textFieldPadding,
                  child: StringListGenerator(
                      initialValue: widget.eventData.rules,
                      title: "Rules",
                      onSaved: (value) {
                        widget.eventData.rules = value!;
                      })),
              Padding(
                  padding: constants.textFieldPadding,
                  child: StringListGenerator(
                      initialValue: widget.eventData.judgingCriteria,
                      title: "Judgement Criteria",
                      onSaved: (value) {
                        widget.eventData.judgingCriteria = value!;
                      })),
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    initialValue: widget.eventData.location,
                    onSaved: (value) {
                      widget.eventData.location = value!;
                    },
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
                    initialValue: widget.eventData.registrationLink,
                    onSaved: (value) {
                      widget.eventData.registrationLink = value!;
                    },
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter registration URL";
                      } else {
                        // RegExp regExp = RegExp(constants.urlPattern);
                        // if (!(regExp.hasMatch(value))) {
                        //   return 'Please enter valid url';
                        // }
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
                    initialValue: widget.eventData.submissionLink,
                    onSaved: (value) {
                      widget.eventData.submissionLink = value!;
                    },
                    style:
                        GoogleFonts.montserrat(color: colors.primaryTextColor),
                    validator: (value) {
                      if (value == "" || value == null) {
                        return "Please enter submission URL";
                      } else {
                        // RegExp regExp = RegExp(constants.urlPattern);
                        // if (!(regExp.hasMatch(value))) {
                        //   return 'Please enter valid url';
                        // }
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
                  defaultValue: widget.eventData.eventType == ""
                      ? null
                      : widget.eventData.eventType,
                  list: _eventType,
                  title: 'Pick Event Type',
                  hint: 'Pick an appropriate event type',
                  onSaved: (data) {
                    widget.eventData.eventType = data ?? "";
                  },
                ),
              ),
              Padding(
                padding: constants.textFieldPadding,
                child: TextFormField(
                    initialValue: widget.eventData.eventDescription,
                    onSaved: (value) {
                      widget.eventData.eventDescription = value!;
                    },
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
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        print(widget.eventData.toJSON);
                        var res;
                        if (!widget.eventUpdate) {
                          res = await makePostRequest(
                              widget.eventData.toJSON, "/addEvent", null, true,
                              context: context);
                        } else {
                          res = await makePostRequest(widget.eventData.toJSON,
                              "/updateEvent", null, true,
                              context: context);
                        }
                        setState(() {
                          showProgress = false;
                        });
                        if (res.statusCode == 200) {
                          error = '';
                          showToast(widget.eventUpdate
                              ? "Event updated successfully"
                              : "Event created successfully");
                          Navigator.of(context).pop();
                        } else {
                          setState(() {
                            error = json.decode(res.body)['message'];
                          });
                        }
                      }
                    },
                    child: Text(
                      widget.eventUpdate ? 'UPDATE EVENT' : 'CREATE EVENT',
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
