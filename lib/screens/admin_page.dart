import 'package:amritotsavam_app/screens/events.dart';
import 'package:amritotsavam_app/widgets/datacard.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {


  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: constants.gradientDecoration,
      child: Column(
        children: [
          DataCard('Manage Accounts',
              'assets/svg/events.svg', Events()),
          DataCard('Manage events',
              'assets/svg/events.svg', Events()),
          DataCard('Publish results',
              'assets/svg/events.svg', Events()),
        ],
      )
    ));
  }
}


//TODO: Be able to add / delete admin accounts - super admins
//TODO: Everyone can delete users
//TODO: CRUD on events
//TODO: Publish results
