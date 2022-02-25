import 'package:amritotsavam_app/models/event_model.dart';
import 'package:amritotsavam_app/screens/result_page.dart';
import 'package:amritotsavam_app/widgets/unordered_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:url_launcher/url_launcher.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key, required this.eventData}) : super(key: key);
  final EventData eventData;

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  bool _rulesExpanded = false;
  bool _judgementExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: constants.gradientDecoration,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: AutoSizeText(
                                      widget.eventData.eventName,
                                      maxLines: 1,
                                      style: GoogleFonts.nunito(
                                          color: colors.primaryTextColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    widget.eventData.location,
                                    style: GoogleFonts.nunito(
                                        color: colors.primaryTextColor,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      color: colors.dateCardColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 10.0),
                                        child: AutoSizeText(
                                          widget.eventData.eventDate,
                                          maxLines: 1,
                                          style: GoogleFonts.nunito(
                                              color: colors.primaryTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        'LAST DATE',
                                        style: GoogleFonts.nunito(
                                            color: colors.primaryTextColor,
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(19),
                            child: const Image(
                                image:
                                    AssetImage('assets/background_image.png'),
                                width: double.infinity,
                                fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Event time: ",
                                  style: GoogleFonts.nunito(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text("${widget.eventData.time} IST",
                              style: GoogleFonts.nunito(
                                color: Colors.white70,
                                fontSize: 18,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Event type: ",
                                  style: GoogleFonts.nunito(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(widget.eventData.eventType,
                              style: GoogleFonts.nunito(
                                color: Colors.white70,
                                fontSize: 18,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20),
                          child: Text(
                            widget.eventData.eventDescription,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 500),
                      children: [
                        ExpansionPanel(
                          backgroundColor: colors.buttonColor,
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              style: ListTileStyle.drawer,
                              iconColor: colors.primaryTextColor,
                              title: Text(
                                'Rules',
                                style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontSize: 17),
                              ),
                            );
                          },
                          body: ListTile(
                            tileColor: colors.dateCardColor,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UnorderedList(widget.eventData.rules),
                            ),
                          ),
                          isExpanded: _rulesExpanded,
                          canTapOnHeader: true,
                        ),
                      ],
                      dividerColor: Colors.grey,
                      expansionCallback: (panelIndex, isExpanded) {
                        _rulesExpanded = !_rulesExpanded;
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 500),
                      children: [
                        ExpansionPanel(
                          backgroundColor: colors.buttonColor,
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              style: ListTileStyle.drawer,
                              iconColor: colors.primaryTextColor,
                              title: Text(
                                'Judgement Criteria',
                                style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontSize: 17),
                              ),
                            );
                          },
                          body: ListTile(
                            tileColor: colors.dateCardColor,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UnorderedList(
                                  widget.eventData.judgingCriteria),
                            ),
                          ),
                          isExpanded: _judgementExpanded,
                          canTapOnHeader: true,
                        ),
                      ],
                      dividerColor: Colors.grey,
                      expansionCallback: (panelIndex, isExpanded) {
                        _judgementExpanded = !_judgementExpanded;
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: !widget.eventData.eventOver ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _launchURL(widget.eventData.submissionLink);
                            },
                            child: Text(
                              'Submit',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: colors.buttonColor,
                              primary: colors.primaryTextColor),
                          onPressed: () {
                            _launchURL(widget.eventData.registrationLink);
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: colors.gradientEndColor),
                          ),
                        ),
                      ],
                    ) : widget.eventData.results != null? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: colors.buttonColor,
                          primary: colors.primaryTextColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(results: widget.eventData.results,)));
                      },
                      child: Text(
                        'Show Results',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: colors.gradientEndColor),
                      ),
                    ) : const Text("Waiting For Results to Publish"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
