import 'package:amritotsavam_app/screens/welcome_page.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/alert_dialog.dart';
import 'package:amritotsavam_app/widgets/custom_sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'change_password.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<List> _getUserData() async {
    var list = [];
    list.add(await getName);
    list.add(await getEmailID);
    list.add(await getDateRegistered);
    list.add(await getUserRole);
    list.add(await getUserId);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _getUserData(),
            builder: (context, AsyncSnapshot<List> data) {
              if (data.hasData) {
                return Container(
                    decoration: constants.gradientDecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomSliverView(
                        columnList: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20, left: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Profile',
                                  style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      color: colors.primaryTextColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              backgroundColor: colors.dataCardColor,
                              minRadius: 70,
                              child: Text(
                                data.data![0][0],
                                style: const TextStyle(fontSize: 65),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(data.data![0],
                                style: GoogleFonts.nunito(
                                    fontSize: 25,
                                    color: colors.primaryTextColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("@" + data.data![4],
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: colors.buttonColor,
                                ),
                                onPressed: () {
                                  displayDialog(context, "Yes", "No", () {
                                    clearAllData();
                                    showToast("Signed out successfully!");
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WelcomePage()),
                                        (Route<dynamic> route) => false);
                                  }, "Are you sure you want to sign out?",
                                      "You will be signed out and all data will be lost");
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      "SIGN OUT",
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          color: colors.buttonColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: colors.buttonColor,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ChangeName()));
                                        },
                                        child: Text(
                                          "CHANGE PASSWORD",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          onPrimary: colors.buttonColor,
                                        ),
                                        onPressed: () {
                                          displayDialog(context, "Yes", "No",
                                              () async {
                                            var res = await makePostRequest(
                                                null, "/deleteSelf", null, true,
                                                context: context);
                                            if (res.statusCode == 200) {
                                              Navigator.of(
                                                      context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const WelcomePage()),
                                                      (Route<dynamic> route) =>
                                                          false);
                                              clearAllData();
                                            } else {
                                              showToast(
                                                  "Something went wrong, could not delete account!");
                                            }
                                          }, "Are you sure you want to delete your account?",
                                              "Your account will be deleted and all data will be lost");
                                        },
                                        child: Text(
                                          "DELETE ACCOUNT",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              } else {
                return Container(
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
              }
            }));
  }
}
