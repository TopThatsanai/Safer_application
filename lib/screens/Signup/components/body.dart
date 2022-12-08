import 'package:flutter/material.dart';
import 'package:safer/components/already_have_an_account_acheck.dart';
import 'package:safer/components/background.dart';
import 'package:safer/components/rounded_button.dart';
import 'package:safer/components/rounded_input_field.dart';
import 'package:safer/components/rounded_password_field.dart';
import 'package:safer/components/rounded_confirm_password_field.dart';
import 'package:safer/components/rounded_phonenumber_field.dart';
import 'package:safer/screens/Login/login_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text(
              "REGISTER",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xFF43484b)),
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedConfirmPasswordField(
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: "First Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: "Last Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.credit_card,
              hintText: "Citizen ID",
              onChanged: (value) {},
            ),
            RoundedInputField(
              icon: Icons.mail,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPhoneNumberField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTER",
              press: () {},
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
