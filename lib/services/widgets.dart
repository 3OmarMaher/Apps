import 'package:flutter/material.dart';
import 'package:graduationproject/views/current_state_page.dart';




class Buttons extends StatefulWidget {
 const Buttons({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
 

  List<String> activites = [
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
    return MaterialButton(
      onPressed: () {
       
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CurrentStatePage(state:activites[activites.length] ,);
          },
        ));
      },
      color: Colors.black,
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
