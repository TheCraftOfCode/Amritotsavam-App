import 'package:amritotsavam_app/screens/admin/events_page.dart';
import 'package:amritotsavam_app/screens/admin/publish_results_page.dart';
import 'package:amritotsavam_app/screens/admin/user_management.dart';
import 'package:amritotsavam_app/widgets/datacard.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key, required this.role}) : super(key: key);
  final String role;

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: constants.gradientDecoration,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, bottom: 20, left: 10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Admin',
                          style: GoogleFonts.nunito(
                              fontSize: 30,
                              color: colors.primaryTextColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  DataCard('Manage Accounts', 'assets/svg/manage_user.svg',
                      UserManagement(role: widget.role)),
                  DataCard('Manage Events', 'assets/svg/events.svg',
                      const EventsList()),
                  DataCard('Manage Results', 'assets/svg/upload_results.svg',
                      const PublishResultsPage()),
                ],
              ),
            )));
  }
}

