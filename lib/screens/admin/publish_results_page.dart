import 'dart:convert';

import 'package:amritotsavam_app/models/event_model.dart';
import 'package:amritotsavam_app/models/results_model.dart';
import 'package:amritotsavam_app/screens/admin/publish_results.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/event_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;

//TODO: Replace mask image with different images depending on type of event
class PublishResultsPage extends StatefulWidget {
  const PublishResultsPage({Key? key}) : super(key: key);

  @override
  _PublishResultsPageState createState() => _PublishResultsPageState();
}

class _PublishResultsPageState extends State<PublishResultsPage> {
  List<EventData> allEventsList = [];

  getListData(http.Response data, bool reloadPage) {
    if (data.statusCode != 200) {
      return;
    }

    Map<String, dynamic> decodedData = jsonDecode(data.body);

    allEventsList.clear();
    for (var i in decodedData['event']) {
      List<ResultsModel> resultData = [];
      if (i['results'] != null || i['results'].length != 0) {
        for (var result in i['results']) {
          resultData.add(ResultsModel(
              name: result['name'],
              rollNumber: result['rollNumber'],
              position: result['position'],
              house: result['house']));
        }
      }
      EventData data = EventData(
          id: i['_id'],
          eventName: i['eventName'],
          eventDate: i['date'],
          time: i['time'],
          location: i['location'],
          rules: i['rules'],
          judgingCriteria: i['judgingCriteria'],
          eventType: i['eventType'],
          registrationLink: i['registrationLink'],
          submissionLink: i['submissionLink'],
          eventOver: i['eventOver'],
          eventDescription: i['eventDescription'],
          results: resultData);
      allEventsList.add(data);
    }
    if (reloadPage) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: makePostRequest(null, "/getPendingResults", null, true,
              context: context),
          builder: (context, AsyncSnapshot<http.Response> data) {
            if (data.hasData) {
              getListData(data.requireData, false);
            }
            if (data.hasData) {
              return RefreshIndicator(
                color: colors.accentColor,
                onRefresh: () async {
                  http.Response data = await makePostRequest(
                      null, "/getPendingResults", null, true,
                      context: context);
                  getListData(data, true);
                },
                child: Container(
                  height: double.maxFinite,
                  decoration: constants.gradientDecoration,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, bottom: 20, left: 30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publish Results',
                                    style: GoogleFonts.nunito(
                                        fontSize: 30,
                                        color: colors.primaryTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Click on an event to publish results',
                                    style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      color: colors.primaryTextColor,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        if (allEventsList.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allEventsList.length,
                            itemBuilder: (_, i) {
                              return MainContentCardWidget(
                                cardTitle: allEventsList[i].eventName,
                                cardSubTitle:
                                allEventsList[i].eventType,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PublishResults(
                                              eventData: allEventsList[i],
                                              onPublishSuccess: () {
                                                setState(() {
                                                  allEventsList.removeAt(i);
                                                });
                                              })));
                                },
                                cardDate: allEventsList[i].eventDate,
                              );
                            },
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "All results have been published",
                                style: GoogleFonts.nunito(
                                  fontSize: 17,
                                  color: colors.primaryTextColor,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                decoration: constants.gradientDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(child: CircularProgressIndicator()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Please wait...',
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
