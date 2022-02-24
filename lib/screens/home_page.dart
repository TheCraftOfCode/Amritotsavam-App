import 'package:amritotsavam_app/screens/admin/add_event.dart';
import 'package:amritotsavam_app/screens/admin/admin_page.dart';
import 'package:amritotsavam_app/screens/events.dart';
import 'package:amritotsavam_app/screens/profile_page.dart';
import 'package:amritotsavam_app/screens/results.dart';
import 'package:amritotsavam_app/screens/signup_page.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/datacard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/widgets/u_nav_bar.dart';
import 'package:amritotsavam_app/widgets/u_nav_bar_item.dart';

import 'about_pages/central_coordinator_page.dart';
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
    var aspectRatioOne = (width / 2) / ((height - 10) / 2);
    var aspectRatioTwo = (width / 2) / ((height - 10) / 3);
    var appBarTitle = currentIndex == 0 ? "Home" : "About";

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
                                DataCard('Central Coordinators',
                                    '', const CentralCoordinators()),
                                DataCard(
                                    'Faculty Coordinators',
                                    'assets/svg/event_managers.svg',
                                    const FacultyCoordinators()),
                                DataCard(
                                    'Team Members',
                                    'assets/svg/team_members.svg',
                                    const SignUpPage())
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
                : Container(
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
          }),
    );
  }
}
