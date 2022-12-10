import 'package:flutter/material.dart';
import 'package:safer/constants.dart';

ButtonStyle buttonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFBFCED5)),
    foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return kPrimaryColor.withOpacity(0.07);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return kPrimaryColor.withOpacity(0.15);
        return null; // Defer to the widget's default.
      },
    ),
  );
}
