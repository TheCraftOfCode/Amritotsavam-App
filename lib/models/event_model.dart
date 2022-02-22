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
      this.results});
}
