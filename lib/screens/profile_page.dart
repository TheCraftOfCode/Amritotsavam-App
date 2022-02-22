import 'package:amritotsavam_app/screens/welcome_page.dart';
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:amritotsavam_app/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;

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
                      child: Column(
                        children: [
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
                                    fontSize: 20, color: Colors.white70)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(data.data![1],
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    color: colors.primaryTextColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Created On: ${data.data![2]}",
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    color: colors.primaryTextColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Role: ${data.data![3]}",
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    color: colors.primaryTextColor)),
                          ),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Change User Name")),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Change Password")),
                                ),
                              )
                            ],
                          ),
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
                                      "Sign Out",
                                      style: GoogleFonts.nunito(
                                          fontSize: 18, color: Colors.blueGrey),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  onPrimary: colors.buttonColor,
                                ),
                                onPressed: () {
                                  displayDialog(context, "Yes", "No", () async {
                                    var res = await makePostRequest(
                                        null, "/deleteSelf", null, true,
                                        context: context);
                                    if (res.statusCode == 200) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WelcomePage()),
                                          (Route<dynamic> route) => false);
                                      clearAllData();
                                    } else {
                                      //TODO: Display Failure
                                    }
                                  }, "Are you sure you want to delete your account?",
                                      "Your account will be deleted and all data will be lost");
                                },
                                child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      "Delete Account",
                                      style: GoogleFonts.nunito(
                                          fontSize: 18, color: Colors.white),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
