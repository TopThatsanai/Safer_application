import 'package:flutter/material.dart';
import 'package:safer/constants.dart';

class RegisDivider extends StatelessWidget {
  const RegisDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Text(
            "If you don't have account, Please regiter!!",
            style: TextStyle(
              color: kPrimaryLightColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.white,
        height: 1.5,
      ),
    );
  }
}
