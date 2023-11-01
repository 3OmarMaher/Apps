//import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/services/widgets.dart';

import 'home_page.dart';
//import 'package:flutter/services.dart';
//import 'package:pedometer/pedometer.dart';

//import 'views/home_page.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({super.key});

  final List<String> activites = [
    'Unknown',
    'Training',
    'Sleeping',
    'Studying',
    'Playing ',
    'Reading',
    'At Collage'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[0] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[0],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[1] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[1],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[2] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[2],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[3] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[3],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[4] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[4],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[5] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[5],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(state:activites[6] );
                },
              ));
            },
            color: Colors.black,
            child: Text(
              activites[6],
              style: const TextStyle(color: Colors.blueAccent),
            ),
          ),
        ]
            //Original Code
            //activites.map((e) => Buttons(text: e),).toList(),
            ),
      ),
    );
  }
}
