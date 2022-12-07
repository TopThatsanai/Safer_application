import 'package:flutter/material.dart';
import 'package:safer/components/rounded_button.dart';
import 'package:safer/constants.dart';
import 'package:safer/screens/Login/login_screen.dart';
import 'package:safer/components/background.dart';
import 'package:safer/screens/Signup/signup_screen.dart';
import 'package:safer/screens/welcome/components/divider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            Image.asset(
              "assets/images/Safer_Icon.PNG",
              height: size.height * 0.45,
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            RegisDivider(),
            RoundedButton(
              text: "REGITER",
              color: kPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}






// Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         Positioned(child: Image.asset("assets/images/background.jpg"
//         fit: BoxFit.cover)),
//       ],
//     );

// Container(
//         constraints: const BoxConstraints.expand(),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/background.jpg"),
//               fit: BoxFit.cover),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Image.asset('assets/images/Safer_Icon.PNG'),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
//                   child: SizedBox(
//                     child: ElevatedButton.icon(
//                       icon: const Icon(Icons.login),
//                       label:
//                           const Text("Log In", style: TextStyle(fontSize: 20)),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return const LoginScreen();
//                         }));
//                       },
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                         child:
//                             Text('If you don\'t have account, Please Register'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//                         child: SizedBox(
//                           child: ElevatedButton.icon(
//                             icon: const Icon(Icons.add),
//                             label: const Text("Register",
//                                 style: TextStyle(fontSize: 20)),
//                             onPressed: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return const RegisterScreen();
//                               }));
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),