import 'package:amritotsavam_app/widgets/admin_user_list.dart';
import 'package:amritotsavam_app/widgets/appbar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

import 'add_admin.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({Key? key, required this.role}) : super(key: key);
  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBackButton(''),
        floatingActionButton: role == constants.superAdmin
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAdmin()));
                },
                child: const Icon(Icons.person_add_alt_1_sharp),
              )
            : Container(),
        body: Container(
          decoration: constants.gradientDecoration,
          child: const AdminUserList(),
        ));
  }
}
