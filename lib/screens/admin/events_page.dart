import 'package:amritotsavam_app/screens/admin/add_event.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

class EventsList extends StatefulWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {

  final listUpcoming = ["EVENT", "EVENT", "EVENT", "EVENT", "EVENT", "EVENT"];
  final listRSVP = ["EVENT", "EVENT", "EVENT", "EVENT", "EVENT", "EVENT"];
  final allEventsList = ["Event", "Event", "Event", "Event", "Event", "Event"];

  String chosenOption = "ALL EVENTS";
  int focusedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _refreshRandomNumbers() =>
      Future.delayed(const Duration(seconds: 2), () {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
      color: colors.accentColor,
      onRefresh: () {
        //TODO: Refresh page on pull
        return _refreshRandomNumbers();
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Events (admin)',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Choose an event to edit it\'s details.', style: GoogleFonts.nunito(fontSize: 17, color: colors.primaryTextColor),),
                      ],
                    )),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allEventsList.length,
                itemBuilder: (_, i) {
                  return _MainContentCardWidget(
                    cardTitle: 'Some Festival Name Here',
                    cardSubTitle: 'This is some festival on some date',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEvent()));
                    },
                    cardDate: 'Feb 2 2022',
                  );
                },
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class _MainContentCardWidget extends StatefulWidget {
  const _MainContentCardWidget({
    Key? key,
    required this.cardSubTitle,
    required this.cardTitle,
    required this.cardDate,
    required this.onTap,
  }) : super(key: key);
  final String cardTitle;
  final String cardSubTitle;
  final String cardDate;
  final VoidCallback onTap;


  @override
  _MainContentCardWidgetState createState() => _MainContentCardWidgetState();
}

class _MainContentCardWidgetState extends State<_MainContentCardWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var horizontalCenteredDisplacement = constraints.maxWidth * 0.3;
            return Stack(
              children: [
                Positioned.fill(
                  left: (horizontalCenteredDisplacement) / 2,
                  child: InkWell(
                    child: Card(
                      elevation: 10,
                      color: colors.inactiveCardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        onTap: widget.onTap,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: (horizontalCenteredDisplacement / 2) + 15,
                              top: 20,
                              bottom: 15,
                              right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      widget.cardTitle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.raleway(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: AutoSizeText(
                                        widget.cardSubTitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.raleway(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: colors.dividerColor),
                                      height: 4.0,
                                      width: 32.0,
                                    ),
                                    Expanded(child: Container()),
                                    AutoSizeText(
                                      widget.cardDate,
                                      minFontSize: 15,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: colors.primaryTextColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                color: Colors.red,
                                padding: EdgeInsets.zero,
                                splashRadius: 15,
                                icon: const Icon(
                                  Icons.delete_forever,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Image.asset(
                      'assets/mask.png',
                      width: horizontalCenteredDisplacement,
                      fit: BoxFit.fill,
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
