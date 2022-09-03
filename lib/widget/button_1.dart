import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  String label;
  void Function()? ontab;
  MyButton({Key? key, required this.label, required this.ontab})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontab,
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(13))),
        child: Center(
          child: Text(widget.label,
              style: TextStyle(
                  fontSize: 15, color: Colors.white)),
        ),
      ),
    );
  }
}
