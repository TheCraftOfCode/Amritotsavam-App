import 'dart:convert';

import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
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
  Future<List<User>> _fetchUsers() async {
    const userAPIURL = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(userAPIURL));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception(
          'Unable to establish a connection with the API. Please check your network (or, the API might be down)');
    }
  }

  ListView _userListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(context, data[index].name, data[index].username,
              data[index].email);
        });
  }

  Widget _tile(context, String name, String username, String email) {
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
              Column(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(email.toLowerCase(),
                        style: GoogleFonts.nunito(
                            color: colors.primaryTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<User>? data = snapshot.data;
          return _userListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    ;
  }
}
