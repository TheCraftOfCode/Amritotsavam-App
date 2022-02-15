import 'package:http/http.dart' as http;
import 'constants.dart';
import 'utils.dart';

Future<http.Response> makePostRequest(body, String route,
    Map<String, dynamic>? queryParameters, attachJWT) async {
  //var body = json.encode({"username": username, "password": password});
  var contentType = {"Content-Type": "application/json"};

  if (attachJWT) {
    contentType["user-auth-token"] = await jwtToken;
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

  return res;
}
