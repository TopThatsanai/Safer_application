import 'package:flutter/material.dart';
import 'package:safer/components/background.dart';
import 'package:safer/components/rounded_input_field.dart';
import 'package:safer/components/rounded_password_field.dart';
import 'package:safer/constants.dart';
import 'package:safer/components/buttonstyle.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:safer/auth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Humm? $errorMessage',
      style: const TextStyle(
          color: Color.fromARGB(255, 223, 81, 93), fontWeight: FontWeight.bold),
    );
  }

  Widget _text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          isLogin ? "Login " : "Register",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Color(0xFF43484b),
          ),
        ),
      ],
    );
  }

  Widget _submitButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.05,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              style: buttonStyle(),
              onPressed: isLogin
                  ? signInWithEmailAndPassword
                  : createUserWithEmailAndPassword,
              child: Text(
                isLogin ? 'Login' : 'Register',
                style: const TextStyle(
                    color: Color(0xFF43484b), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          isLogin ? "Don't have an account? " : "Already have an Account? ",
          style: const TextStyle(color: kPrimaryLightColor),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            isLogin ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _text(),
              RoundedInputField(
                  hintText: 'Email',
                  icon: Icons.mail,
                  controller: _controllerEmail),
              RoundedPasswordField(controller: _controllerPassword),
              SizedBox(
                height: size.height * 0.05,
              ),
              _errorMessage(),
              _submitButton(),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: size.height * 0.3,
//             ),
//             const Text(
//               "LOGIN",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   color: Color(0xFF43484b)),
//             ),
//             SizedBox(
//               height: size.height * 0.03,
//             ),
//             RoundedInputField(
//               icon: Icons.person,
//               hintText: "Your Email",
//               onChanged: (value) {},
//             ),
//             RoundedPasswordField(
//               onChanged: (value) {},
//             ),
//             RoundedButton(
//               text: "LOGIN",
//               press: () {},
//             ),
//             SizedBox(
//               height: size.height * 0.03,
//             ),
//             AlreadyHaveAnAccountCheck(
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SignUpScreen();
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
