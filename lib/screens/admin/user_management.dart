import 'package:amritotsavam_app/widgets/admin_user_list.dart';
import 'package:amritotsavam_app/widgets/appbar_back_button.dart';
import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

class UserManagement extends StatelessWidget {
  const UserManagement({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBackButton(''),
        body: Container(
          decoration: constants.gradientDecoration,
          child: const AdminUserList(),
        )
    );
  }
}
