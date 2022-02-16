import 'package:flutter/material.dart';

Widget ErrorBox(errorMessage) {
  return errorMessage != null && errorMessage != ""
      ? Container(
          child: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: const Color.fromARGB(255, 255, 172, 172),
            borderRadius: BorderRadius.circular(5.0),
          ),
          height: 50,
          width: double.infinity,
        )
      : Container();
}