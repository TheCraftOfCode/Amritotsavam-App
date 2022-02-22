import 'dart:convert';

import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'alert_dialog.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String role;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      username: json['userId'],
      email: json['email'],
      role: json['role'],
    );
  }
}

class AdminUserList extends StatefulWidget {
  const AdminUserList({Key? key}) : super(key: key);

  @override
  _AdminUserListState createState() => _AdminUserListState();
}

class _AdminUserListState extends State<AdminUserList> {
  //Replace with relevant code

  List? listData = [];

  Future<http.Response> _fetchUsers() async {
    return await makePostRequest(null, "/getUsers", null, true,
        context: context);
  }

  _putListData(http.Response responseData, bool setStateBool) {
    listData?.clear();
    var jsonResponse = json.decode(responseData.body);
    if (jsonResponse['users'] != null) {
      listData =
          jsonResponse['users'].map((user) => User.fromJson(user)).toList();
    }
    if (setStateBool) setState(() {});
  }

  _userListView() {
    if (listData!.isNotEmpty) {
      return ListView.builder(
          itemCount: listData!.length,
          itemBuilder: (context, index) {
            return _tile(
                context,
                listData![index].name,
                listData![index].username,
                listData![index].email,
                listData![index].role,
                index);
          });
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Center(
              child: Text(
                "No users found",
                style: GoogleFonts.nunito(
                    color: colors.primaryTextColor, fontSize: 20),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _tile(context, String name, String username, String email, String role,
      int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Card(
        color: colors.inactiveCardColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 2),
                      child: Text(
                        name,
                        style: GoogleFonts.nunito(
                            color: colors.primaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(('@$username'),
                        style: GoogleFonts.nunito(
                            color: colors.textBoxTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Text(('Role: $role'),
                        style: GoogleFonts.nunito(
                            color: colors.textBoxTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(email.toLowerCase(),
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.nunito(
                              color: colors.primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      if (role == "admin") {
                        displayDialog(context, "Yes", "No", () async {
                          Navigator.of(context).pop();
                          final response = await makePostRequest(
                              json.encode({"email": email}),
                              "/deleteAdminUser",
                              null,
                              true,
                              context: context);
                          if (response.statusCode == 200) {
                            setState(() {
                              listData?.removeAt(index);
                            });
                            //TODO: Toast on success

                          }
                        }, "Delete Admin",
                            "Are you sure you want to delete this admin?");
                      } else if (role == "user") {
                        displayDialog(context, "Yes", "No", () async {
                          Navigator.of(context).pop();
                          final response = await makePostRequest(
                              json.encode({"email": email}),
                              "/deleteUser",
                              null,
                              true,
                              context: context);
                          if (response.statusCode == 200) {
                            setState(() {
                              listData?.removeAt(index);
                            });
                            //TODO: Toast on success

                          }
                        }, "Delete User",
                            "Are you sure you want to delete this user?");
                      }
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUsers(),
      builder: (context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.statusCode == 200) {
            _putListData(snapshot.data!, false);
          }
          return RefreshIndicator(
              child: _userListView(),
              onRefresh: () async {
                http.Response responseData = await _fetchUsers();
                _putListData(responseData, true);
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
