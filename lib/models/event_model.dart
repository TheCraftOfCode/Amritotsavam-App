import 'dart:convert';

import 'package:amritotsavam_app/models/results_model.dart';

class EventData {
  String id;
  String eventName;
  String eventDate;
  String time;
  String location;
  List<dynamic> rules;
  List<dynamic> judgingCriteria;
  String eventType;
  String registrationLink;
  String eventDescription;
  String submissionLink;
  bool eventOver;
  List<ResultsModel>? results;

  EventData(
      {required this.id,
      required this.eventDate,
      required this.eventName,
      required this.time,
      required this.location,
      required this.rules,
      required this.judgingCriteria,
      required this.eventType,
      required this.registrationLink,
      required this.submissionLink,
      required this.eventOver,
      required this.eventDescription,
      this.results});

  get toJSON {
    return json.encode({
      "id": id,
      "eventName": eventName,
      "date": eventDate,
      "time": time,
      "location": location,
      "rules": rules,
      "registrationLink": registrationLink,
      "submissionLink": submissionLink,
      "judgingCriteria": judgingCriteria,
      "eventType": eventType,
      "eventDescription": eventDescription
    });
  }
}
