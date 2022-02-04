import 'package:flutter/material.dart';

//TODO: Style externally in ThemeData
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: const Text("REPLACE LOGO")),
            Center(child: const Text("REPLACE CAPTION")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text("Login"),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text("Sign Up"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
