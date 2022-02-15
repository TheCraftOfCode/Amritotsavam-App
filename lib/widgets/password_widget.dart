import 'package:flutter/material.dart';

class PasswordFormFieldWidget extends StatefulWidget {
  const PasswordFormFieldWidget(
      {Key? key,
      this.passwordKey,
      this.controller,
      this.style,
      this.validator,
      required this.label,
      required this.hintText})
      : super(key: key);
  final GlobalKey<FormFieldState>? passwordKey;
  final TextEditingController? controller;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;

  @override
  _PasswordFormFieldWidgetState createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  bool setPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !setPasswordVisible,
      key: widget.passwordKey,
      controller: widget.controller,
      validator: widget.validator,
      style: widget.style,
      decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              setPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                setPasswordVisible = !setPasswordVisible;
                print(setPasswordVisible);
              });
            },
          )),
    );
  }
}
