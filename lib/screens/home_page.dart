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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarBackButton("Home"),
        body: SizedBox(
          height: MediaQuery.of(context).size.height*0.7,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height*0.235,
                  child: Row(
                children: [
                  VerticalCard(
                      route:
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                      title: 'Nirmal Karthikeyan',
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route:
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                      title: 'Nirmal Karthikeyan',
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.235,
                  child: Row(
                children: [
                  VerticalCard(
                      route:
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                      title: 'Nirmal Karthikeyan',
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                  VerticalCard(
                      route:
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                      title: 'Nirmal Karthikeyan',
                      svgLocation: 'svgLocation',
                      gradientStartingColor: colors.gradientStartColor,
                      gradientEndingColor: colors.gradientEndColor),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
