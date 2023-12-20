//import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/views/current_state_page.dart';

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
    
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topLeft ,
              end: Alignment.bottomRight,
              colors: [
                  
                Colors.white,
                Color.fromARGB(255, 211, 245, 225),
                Color.fromARGB(255, 132, 255, 226),
              ],),
          ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[0]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[1]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[1],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[2]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[2],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[3]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[3],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[4]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[4],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[5]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[5],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return CurrentStatePage(state: activites[6]);
                  },
                ));
              },
              color: Colors.black,
              child: Text(
                activites[6],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ]
              //Original Code
              //activites.map((e) => Buttons(text: e),).toList(),
              ),
        ),
      ),
    );
  }
}
