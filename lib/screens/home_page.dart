import 'package:amritotsavam_app/screens/about_pages/digital.dart';
import 'package:amritotsavam_app/screens/about_pages/elected_representatives.dart';
import 'package:amritotsavam_app/screens/about_pages/multimedia.dart';
import 'package:amritotsavam_app/screens/admin/admin_page.dart';
import 'package:amritotsavam_app/screens/events.dart';
import 'package:amritotsavam_app/screens/profile_page.dart';
import 'package:amritotsavam_app/screens/results.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/datacard.dart';
import 'package:amritotsavam_app/widgets/vertical_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_pages/central_coordinator_page.dart';
import 'about_pages/contact_us.dart';
import 'about_pages/faculty_coordinators_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  _getUserData() async {
    return await getUserRole;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    height -= kToolbarHeight;
    height -= kBottomNavigationBarHeight;
    var aspectRatioTwo = (width / 2) / ((height - 40) / 3);

    ///(width / columnCount) / (height / minRowCountOnScreen)

    return SafeArea(
      child: FutureBuilder(
          future: _getUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> data) {
            return data.hasData
                ? Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: currentIndex,
                      onTap: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                        pageController.animateToPage(
                          index,
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          curve: Curves.easeIn,
                        );
                      },
                      backgroundColor: const Color(0xff302B62),
                      unselectedItemColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.info_outline),
                          label: 'About',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                        if (data.data == constants.admin ||
                            data.data == constants.superAdmin)
                          const BottomNavigationBarItem(
                            icon: Icon(Icons.admin_panel_settings_outlined),
                            label: 'Admin',
                          ),
                      ],
                    ),
                    body: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      children: [
                        Container(
                          decoration: constants.gradientDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                //TODO: Add appbar with navigation drawer, notifications icon
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20, left: 10),
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
                                DataCard('Events', 'assets/svg/events.svg',
                                    const Events()),
                                DataCard('Results', 'assets/svg/results.svg',
                                    const ResultsHomePage())
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: constants.gradientDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                //TODO: Add appbar with navigation drawer, notifications icon
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20, left: 10),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'About',
                                        style: GoogleFonts.nunito(
                                            fontSize: 30,
                                            color: colors.primaryTextColor,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: aspectRatioTwo,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    children: [
                                      VerticalCard(
                                          title: "Central Coordinators",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                              colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const CentralCoordinators(),
                                          gradientEndingColor:
                                              colors.dataCardColor),
                                      VerticalCard(
                                          title: "Faculty Coordinators",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                              colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const FacultyCoordinators(),
                                          gradientEndingColor:
                                              colors.dataCardColor),
                                      VerticalCard(
                                          title: "Elected Representatives",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                              colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const ElectedRepresentatives(),
                                          gradientEndingColor:
                                              colors.dataCardColor),
                                      VerticalCard(
                                          title: "Digital \nContent Team",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                              colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const DigitalTeam(),
                                          gradientEndingColor:
                                              colors.dataCardColor),
                                      VerticalCard(
                                          title: "Multimedia \nTeam",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                              colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const MultiMediaTeam(),
                                          gradientEndingColor:
                                              colors.dataCardColor),
                                      VerticalCard(
                                          title: "Contact \nUs",
                                          svgLocation: "svgLocation",
                                          gradientStartingColor:
                                          colors.dataCardColor,
                                          textAlign: TextAlign.start,
                                          fontSize: 18,
                                          route: const ContactUs(),
                                          gradientEndingColor:
                                          colors.dataCardColor)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const ProfilePage(),
                        if (data.data == constants.admin ||
                            data.data == constants.superAdmin)
                          AdminPage(
                            role: data.data,
                          )
                      ],
                    ),
                  )
                : Scaffold(
                  body: Container(
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
                    ),
                );
          }),
    );
  }
}
