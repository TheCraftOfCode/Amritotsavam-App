import 'package:amritotsavam_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'constants.dart';
import 'utils.dart';

Future<http.Response> makePostRequest(
    body, String route, Map<String, dynamic>? queryParameters, attachJWT,
    {BuildContext? context}) async {
  try {
    var contentType = {"Content-Type": "application/json"};

    if (attachJWT) {
      contentType["user-auth-token"] = await jwtTokenGet;
    }

    var res = await http
        .post(
            isHTTPS
                ? Uri.https(networkAddress, route, queryParameters)
                : Uri.http(networkAddress, route, queryParameters),
            headers: contentType,
            body: body)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Server Timed out!', 408); // Request Timeout response status code
      },
    );

    if (res.statusCode == 412) {
      if (context != null) {
        jwtTokenSet = "";
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomePage()),
            (Route<dynamic> route) => false);
      }
      showToast("Invalid or expired token, logging out");
    }

    return res;
  } catch (e) {
    return http.Response('Could not connect to server', 408);
  }
}