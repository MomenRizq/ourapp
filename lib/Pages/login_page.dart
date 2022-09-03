import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ourapp/Pages/bottom_navigationbar_pages.dart';
import 'package:ourapp/main.dart';
import 'package:ourapp/Pages/sign_up.dart';
import 'package:ourapp/widget/button_1.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                child: Image.asset("assets/login.jpg"),
              ),
            ),
            LoginForm(),
          ],
        ),);
  }
  Widget LoginForm(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "email is empty ,write your email , please.";
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Enter your Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true, //To hide password

              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is empty , write your Password , please.";
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Enter your password"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: MyButton(
                label: "Log in",
                ontab: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: email, password: password);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text('Welcome'),
                        duration: Duration(seconds: 5),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                              const HomeOfApp())));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content:
                        Text("Fill in your data Correctly"),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  }
                }),
          ),
          SizedBox(height: 10),
          TextButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 204, 204, 204)),
              ),
              onPressed: () {}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account? ",
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
                    RotateAnimatedText('Register now'),
                  ],
                  repeatForever: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SignUp())));
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
