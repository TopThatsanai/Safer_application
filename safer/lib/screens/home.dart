import 'package:flutter/material.dart';
import 'package:safer/screens/login.dart';
import 'package:safer/screens/register.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Sefer'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/Safer_Icon.PNG'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: SizedBox(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Log In", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child:
                          Text('If you don\'t have account, Please Register'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: SizedBox(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.add),
                          label:
                              Text("Register", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterScreen();
                            }));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
