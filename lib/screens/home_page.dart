import 'package:amritotsavam_app/screens/signup_page.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/widgets/appbar_back_button.dart';
import 'package:amritotsavam_app/widgets/vertical_card.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
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
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'About',
            ),
          ],
        ),
        appBar: AppBarBackButton(appBarTitle),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: aspectRatioOne,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Events',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.start,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Schedule',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.start,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Rules',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.start,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Results',
                      textAlign: TextAlign.start,
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: aspectRatioTwo,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'About Amritotsovam',
                      textAlign: TextAlign.center,
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Central Coordinators',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.center,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Event Managers',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.center,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'House Captains',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.center,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Team Members',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.center,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route: MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                      title: 'Contact Us',
                      svgLocation: 'svgLocation',
                      textAlign: TextAlign.center,
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
