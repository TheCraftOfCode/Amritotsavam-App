import 'dart:convert';

import 'package:amritotsavam_app/models/event_model.dart';
import 'package:amritotsavam_app/models/results_model.dart';
import 'package:amritotsavam_app/screens/event_page.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/widgets/event_card.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

///Apparently using static values in SizedBoxes and ConstrainedBoxes are
///more responsive than using mediaQueries, the value is relative just like dp
/// in android

class _EventsState extends State<Events> {
  //TODO: Update lists with model
  final List<EventData> listUpcoming = [];
  final List<EventData> allEventsList = [];

  String chosenOption = "ALL EVENTS";
  int focusedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  getListData(http.Response data, bool reloadPage) {
    if (data.statusCode != 200) {
      return;
    }

    Map<String, dynamic> decodedData = jsonDecode(data.body);

    allEventsList.clear();
    listUpcoming.clear();
    for (var i in decodedData['data']) {
      var givenDate = DateTime.now();

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
          results: resultData);
      if (DateFormat("dd/MM/yyyy").parse(i['date']).isAfter(givenDate)) {
        listUpcoming.add(data);
      }
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
          future:
              makePostRequest(null, "/getEvents", null, true, context: context),
          builder: (context, AsyncSnapshot<http.Response> data) {
            if (data.hasData) {
              getListData(data.requireData, false);
            }
            return data.hasData
                ? RefreshIndicator(
                    color: colors.accentColor,
                    onRefresh: () async {
                      http.Response data = await makePostRequest(
                          null, "/getEvents", null, true,
                          context: context);
                      getListData(data, true);
                    },
                    child: Container(
                      decoration: constants.gradientDecoration,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO: Add appbar with search and notifications
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 70.0, bottom: 20, left: 15),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Home',
                                    style: GoogleFonts.nunito(
                                        fontSize: 30,
                                        color: colors.primaryTextColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            if (listUpcoming.isNotEmpty)
                              _HorizontalListView(
                                  context: context,
                                  list: listUpcoming,
                                  title: "Upcoming Events"),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'All Events',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: colors.primaryTextColor),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allEventsList.length,
                              itemBuilder: (_, i) {
                                return MainContentCardWidget(
                                  cardTitle: allEventsList[i].eventName,
                                  cardSubTitle:
                                      'Event type - ${allEventsList[i].eventType}',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EventsPage(
                                                  eventData: allEventsList[i],
                                                )));
                                  },
                                  cardDate: allEventsList[i].eventDate,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class _HorizontalListView extends StatefulWidget {
  final List<EventData> list;
  final String title;
  final BuildContext context;

  const _HorizontalListView(
      {Key? key,
      required this.context,
      required this.title,
      required this.list})
      : super(key: key);

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<_HorizontalListView> {
  int currentPagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                  color: colors.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: widget.list.length,
              padEnds: false,
              onPageChanged: (page) {
                setState(() {
                  currentPagePosition = page;
                });
              },
              controller: PageController(viewportFraction: 0.7),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _horizontalWidgetCard(
                    widget.list[index].eventName,
                    widget.list[index].eventDate,
                    () {},
                    currentPagePosition == index);
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _horizontalWidgetCard(cardTitle, cardDate, onTap, inFocus) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 15),
      child: Card(
        color:
            inFocus == true ? colors.activeCardColor : colors.inactiveCardColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        child: Stack(
          children: [
            InkWell(
              onTap: onTap,
            ),
            Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/mask.png',
                    fit: BoxFit.fill,
                    width: 70,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: Add icon based on event category
                  Text(
                    cardTitle,
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(cardDate,
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ],
        ),
        elevation: 10,
      ));
}
