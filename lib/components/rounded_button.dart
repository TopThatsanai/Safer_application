import 'package:flutter/material.dart';
import 'package:safer/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: SizedBox(
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(color),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return color.withOpacity(0.07);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return color.withOpacity(0.15);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: press,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
