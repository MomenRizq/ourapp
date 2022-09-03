import 'package:flutter/material.dart';

class aboutProject extends StatelessWidget {
  const aboutProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("about app"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15) ,
          height: 150,
          width: 450,
          decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15)
          ),
          child: ListTile(
            title:Container(
                child: Text(
                  "The mobile application allows you to shop and buy clothes or accessories and also provides the user with 7 different sections and the user can see and modify his profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

          ),
        ),
      ),
    );
  }
}
