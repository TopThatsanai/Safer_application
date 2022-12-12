import 'package:flutter/material.dart';
import 'package:safer/components/text_field_container.dart';
import 'package:safer/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      controller: controller,
      decoration: const InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        // suffix icon //
        // suffixIcon: Icon(
        //   Icons.visibility,
        //   color: kPrimaryColor,
        // ),
        border: InputBorder.none,
      ),
    ));
  }
}
