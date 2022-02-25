import 'package:amritotsavam_app/utils/http_modules.dart';
import 'package:amritotsavam_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:amritotsavam_app/utils/constants.dart' as constants;

/// *
/// This widget can be used between usual widgets to avoid rendering
/// new pages when jwt not found or jwt is invalid.
///
/// @param:
/// Default Page, page to default to when jwt not found
/// Target Page, page to load if jwt found
///
/// @returns:
/// Widget, appropriate widget depending on jwt state
///
/// Usage:
/// LoadValidPageWidget(Login(), Home());

class LoadValidPageWidget extends StatelessWidget {
  const LoadValidPageWidget(this.defaultPage, this.targetPage, {Key? key})
      : super(key: key);

  final Widget defaultPage;
  final Widget targetPage;

  Future<String> getVerifiedJwt(context) async {
    var jwt = await jwtTokenGet;
    if (jwt == '') return '';

    var res = await makePostRequest(null, "/validateToken", null, true,
        context: context);
    print(res.statusCode);
    if (res.statusCode != 200 && res.statusCode != 412) {
      showToast("Could not authenticate to server, continuing in offline mode!");
    }
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVerifiedJwt(context),
        builder: (context, data) {
          if (!data.hasData) {
            return Scaffold(
              body: Container(
                decoration: constants.gradientDecoration,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Image(
                            image:
                                AssetImage('assets/amritotsavam_logo_mini.png')),
                      ),
                    ),
                    const Expanded(child: Center(
                      child: CircularProgressIndicator(),
                    )),
                  ],
                ),
              ),
            );
          } else if (data.hasData && data.data == '') {
            return defaultPage;
          } else {
            return targetPage;
          }
        });
  }
}
