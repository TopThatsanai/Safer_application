import 'package:flutter/material.dart';
import 'package:safer/components/text_field_container.dart';
import 'package:safer/constants.dart';

class RoundedPhoneNumberField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPhoneNumberField({
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
        hintText: "Phone Number",
        icon: Icon(
          Icons.phone,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
