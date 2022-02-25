import 'dart:convert';

import 'package:amritotsavam_app/models/event_model.dart';
import 'package:amritotsavam_app/models/results_model.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/alert_dialog.dart';
import 'package:amritotsavam_app/widgets/dropdown_widget.dart';
import 'package:amritotsavam_app/widgets/error_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

class PublishResults extends StatefulWidget {
  const PublishResults(
      {Key? key, required this.onPublishSuccess, required this.eventData})
      : super(key: key);

  final VoidCallback onPublishSuccess;
  final EventData eventData;

  @override
  State<PublishResults> createState() => _PublishResultsState();
}

class _PublishResultsState extends State<PublishResults> {
  final List<String> _houses = [
    'AMRITAMAYI',
    'ANANDAMAYI',
    'CHINMAYI',
    'JYOTHIRMAYI'
  ];

  final _formKey = GlobalKey<FormState>();
  final _firstPlaceNameController = TextEditingController();
  final _firstPlaceRollNoController = TextEditingController();

  final _secondPlaceNameController = TextEditingController();
  final _secondPlaceRollNoController = TextEditingController();

  final _thirdPlaceNameController = TextEditingController();
  final _thirdPlaceRollNoController = TextEditingController();
  bool showProgress = false;

  _initializeEmptyResults(){
    //Initializes results if empty
    widget.eventData.results = [
      ResultsModel(name: "", rollNumber: "", position: 1, house: ""),
      ResultsModel(name: "", rollNumber: "", position: 2, house: ""),
      ResultsModel(name: "", rollNumber: "", position: 3, house: "")
    ];
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    if (widget.eventData.results != null &&
        widget.eventData.results!.isNotEmpty) {
      _firstPlaceNameController.text = widget.eventData.results![0].name;
      _secondPlaceNameController.text = widget.eventData.results![1].name;
      _thirdPlaceNameController.text = widget.eventData.results![2].name;

      _firstPlaceRollNoController.text =
          widget.eventData.results![0].rollNumber;
      _secondPlaceRollNoController.text =
          widget.eventData.results![1].rollNumber;
      _thirdPlaceRollNoController.text =
          widget.eventData.results![2].rollNumber;
    } else {
      _initializeEmptyResults();
    }
  }

  String? _firstPlaceHouse, _secondPlaceHouse, _thirdPlaceHouse;

  // ignore: prefer_function_declarations_over_variables
  String? Function(String?) nameValidator = (value) {
    if (value == "" || value == null) {
      return "Please enter name";
    } else {
      return null;
    }
  };

  // ignore: prefer_function_declarations_over_variables
  String? Function(String?) rollNumber = (value) {
    if (value == "" || value == null) {
      return "Please enter roll number";
    } else {
      return null;
    }
  };

  String error = "";

  //Event Identifiers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: constants.gradientDecoration,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        'Publish Results (admin)',
                        style: GoogleFonts.nunito(
                            fontSize: 30,
                            color: colors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
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
                      controller: _firstPlaceNameController,
                      validator: nameValidator,
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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                      controller: _firstPlaceRollNoController,
                      style: GoogleFonts.nunito(color: colors.primaryTextColor),
                      validator: rollNumber,
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: DropDownFormField(
                    defaultValue: widget.eventData.results![0].house != ""
                        ? widget.eventData.results![0].house
                        : null,
                    list: _houses,
                    title: 'House',
                    hint: 'Pick the house',
                    onSaved: (data) {
                      _firstPlaceHouse = data;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                      controller: _secondPlaceNameController,
                      validator: nameValidator,
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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                      controller: _secondPlaceRollNoController,
                      style: GoogleFonts.nunito(color: colors.primaryTextColor),
                      validator: rollNumber,
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: DropDownFormField(
                      list: _houses,
                      defaultValue: widget.eventData.results![1].house != ""
                          ? widget.eventData.results![1].house
                          : null,
                      title: 'House',
                      hint: 'Pick the house',
                      onSaved: (data) {
                        _secondPlaceHouse = data;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                      controller: _thirdPlaceNameController,
                      validator: nameValidator,
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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                      controller: _thirdPlaceRollNoController,
                      style: GoogleFonts.nunito(color: colors.primaryTextColor),
                      validator: rollNumber,
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: DropDownFormField(
                      list: _houses,
                      defaultValue: widget.eventData.results![2].house != ""
                          ? widget.eventData.results![2].house
                          : null,
                      title: 'House',
                      hint: 'Pick the house',
                      onSaved: (data) {
                        _thirdPlaceHouse = data;
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: error != "" ? Container() : ErrorBox(error),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: showProgress
                        ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                        : Row(
                            children: [
                              ElevatedButton(
                                child: Text(
                                  widget.eventData.eventOver
                                      ? 'UPDATE'
                                      : 'PUBLISH',
                                  style: GoogleFonts.nunito(
                                      color: colors.primaryTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    //Updates value back to model so that user will see updated values without refreshing
                                    widget.eventData.results![0].name =
                                        _firstPlaceNameController.text;
                                    widget.eventData.results![0].rollNumber =
                                        _firstPlaceRollNoController.text;
                                    widget.eventData.results![0].house =
                                        _firstPlaceHouse!;

                                    widget.eventData.results![1].name =
                                        _secondPlaceNameController.text;
                                    widget.eventData.results![1].rollNumber =
                                        _secondPlaceRollNoController.text;
                                    widget.eventData.results![1].house =
                                        _secondPlaceHouse!;

                                    widget.eventData.results![2].name =
                                        _thirdPlaceNameController.text;
                                    widget.eventData.results![2].rollNumber =
                                        _thirdPlaceRollNoController.text;
                                    widget.eventData.results![2].house =
                                        _thirdPlaceHouse!;

                                    var resultData = {
                                      "id": widget.eventData.id,
                                      "results": [
                                        {
                                          "name":
                                              _firstPlaceNameController.text,
                                          "rollNumber":
                                              _firstPlaceRollNoController.text,
                                          "position": 1,
                                          "house": _firstPlaceHouse!
                                        },
                                        {
                                          "name":
                                              _secondPlaceNameController.text,
                                          "rollNumber":
                                              _secondPlaceRollNoController.text,
                                          "position": 2,
                                          "house": _secondPlaceHouse!
                                        },
                                        {
                                          "name":
                                              _thirdPlaceNameController.text,
                                          "rollNumber":
                                              _thirdPlaceRollNoController.text,
                                          "position": 3,
                                          "house": _thirdPlaceHouse!
                                        }
                                      ]
                                    };
                                    setState(() {
                                      showProgress = true;
                                    });
                                    var res = await makePostRequest(
                                        json.encode(resultData),
                                        "/publishResult",
                                        null,
                                        true,
                                        context: context);
                                    setState(() {
                                      showProgress = false;
                                    });
                                    if (res.statusCode == 200) {
                                      error = '';
                                      showToast(
                                          "Results published successfully!");
                                      widget.eventData.eventOver = true;
                                      Navigator.of(context).pop();
                                    } else {
                                      setState(() {
                                        error =
                                            json.decode(res.body)['message'];
                                      });
                                    }
                                  }
                                },
                              ),
                              if (widget.eventData.eventOver)
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          onPrimary: colors.buttonColor,
                                          primary: colors.primaryTextColor),
                                      onPressed: () {
                                        displayDialog(context, "Continue", null, () async {
                                          setState(() {
                                            showProgress = true;
                                          });
                                          var res = await makePostRequest(
                                              json.encode(
                                                  {"id": widget.eventData.id}),
                                              "/revertResults",
                                              null,
                                              true,
                                              context: context);
                                          setState(() {
                                            showProgress = false;
                                          });
                                          if (res.statusCode == 200) {
                                            error = '';
                                            showToast(
                                                "Results removed successfully!");
                                            widget.eventData.eventOver = false;
                                            _initializeEmptyResults();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          } else {
                                            setState(() {
                                              error = json
                                                  .decode(res.body)['message'];
                                            });
                                          }
                                        }, "Are you sure you want delete the results",
                                            "Results for this event will be deleted");
                                      },
                                      child: Text(
                                        "REVERT RESULTS",
                                        style: GoogleFonts.nunito(
                                            color: colors.buttonColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )),
                                ),
                            ],
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
