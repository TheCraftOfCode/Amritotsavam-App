import 'package:amritotsavam_app/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class AddAdmin extends StatefulWidget {

  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {

 List<String> _roles = ['admin','super_admin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(height: 60,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Add user',
                      style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              DropDownFormField(list: _roles, title: 'Pick role', hint: 'Pick an appropriate role'),
              //TODO: Find out user model and collect relevant details
            ],
          ),
        ),
      ),
    );
  }
}
