import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  @override
  List<String> name = [
    'Ola Reda AbdelRazek',
    'Ghada Mohamed Fathy',
    'Moamen Mohamed Rizq'
  ];
  List<String> faculty = [
    'Faculty of Engineering',
    'Faculty of Engineering',
    'Faculty of Computer Science'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _aboutus(),
      ),
    );
  }

  ListView _aboutus() {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            title: Text(name[index]),
            subtitle: Text(faculty[index]),
            trailing: Text("G4" , style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
