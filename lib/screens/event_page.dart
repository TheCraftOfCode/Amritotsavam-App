import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:url_launcher/url_launcher.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _url =
      "https://forms.office.com/Pages/ResponsePage.aspx?id=o835AF4H5USqC6ujrdZTn0SCTfFMedVCpsWxs5LS-T9UMEFFUVkyMlM5OEVTODFJN0dTU1ExSlJTRi4u";

  void _launchURL() async {
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 60,),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('This is an event',style: GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 30, fontWeight: FontWeight.bold),),
                                    Text('Venue', style: GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 18.0),),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                                    child: Text('31st May 22', style: GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 17),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text('LAST DATE', style: GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 12),),
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
                                image: AssetImage('assets/background_image.png'),
                                width: double.infinity,
                                fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Remaining time: ",
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                  fontSize: 20)),
                              //TODO: Add remaining time widget
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2),
                          child: Text("5:30 PM IST",
                              style: GoogleFonts.nunito(
                                color: Colors.white70,
                                fontSize: 18,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                          backgroundColor: Colors.blue,
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text(
                                'Rules',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                          body: const ListTile(
                            title: Text('Description text',
                                style: TextStyle(color: Colors.black)),
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
                  //TODO: Style ExpansionPanelList
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
                          backgroundColor: Colors.blue,
                          headerBuilder: (context, isExpanded) {
                            return const ListTile(
                              title: Text(
                                'Judgement Criteria',
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                          body: const ListTile(
                            title: Text('Description text',
                                style: TextStyle(color: Colors.black)),
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
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: _launchURL, child: Text('Submit', style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 17),)),
                        const SizedBox(width: 20,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: colors.primaryTextColor
                          ),
                          onPressed: _launchURL,
                          child: Text('Register', style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 17, color: colors.gradientEndColor),),
                        ),
                      ],
                    ),
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
