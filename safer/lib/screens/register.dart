import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(100, 50, 100, 40),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Form(
                    child: Column(
                  children: [
                    const Text('Username'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Password'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Comfirm password'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('First Name'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Last Name'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('ID'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('E-mail'),
                    TextFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Phone Number'),
                    TextFormField(),
                    SizedBox(
                      child: ElevatedButton(
                        child: const Text('Register'),
                        onPressed: () {},
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
