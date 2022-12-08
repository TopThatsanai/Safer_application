import 'package:flutter/material.dart';
import 'package:safer/components/text_field_container.dart';
import 'package:safer/constants.dart';

class RoundedIdField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedIdField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Citizen id",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
