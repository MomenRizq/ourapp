import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ourapp/Pages/login_page.dart';
import 'package:ourapp/widget/button_1.dart';

import '../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 350,
              width: 400,
              child: Image.asset("assets/register.jpg"),
            ),
          ),
          signupForm(),
        ],
      ),
    );
  }

  Widget signupForm(){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "You must enter your name";
                }
              },
              decoration: InputDecoration(
                labelText: "Enter your name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "You must enter your email";
                }
              },
              decoration: InputDecoration(
                labelText: "Enter your email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "You must enter your password";
                }
                if (value.length < 8) {
                  return "Weak password ,Make a stronger one";
                }
              },
              decoration: InputDecoration(
                labelText: "Enter your Password",
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: MyButton(
                label: "Register",
                ontab: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: const Text("Done successfully "),
                        duration: Duration(seconds: 5),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LogInScreen())));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: const Text("Fill in your data Correctly"),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  }
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Do you have already account? ",
                style: TextStyle(fontSize: 15.0),
              ),
              const SizedBox(width: 5.0, height: 50.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Login'),
                  ],
                  repeatForever: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LogInScreen())));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
