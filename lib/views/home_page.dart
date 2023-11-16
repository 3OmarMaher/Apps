import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationproject/services/notification.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'page_three.dart';

NotificationService notificationService = NotificationService();

String currentState = "Unknown";

int selectedId = 99;
Map<int, String> personPossibleStatuses = {
  0: "Sleeping",
  1: "Studying",
  2: "Training",
  99: "Unknown"
};
double movementThreshold = 12;
double acceleration = 0;
bool isMoving = false;
DateTime lastMovementTime = DateTime.now();

class MyHomePage extends StatelessWidget {
  final String state;
  MyHomePage({
    super.key,
    required this.state,
  }) {
    void initState() {
      AwesomeNotifications().cancelAllSchedules();

      // Initialize sensor listeners
      accelerometerEvents.listen((AccelerometerEvent event) {
        // Calculate total acceleration
        acceleration = event.x + event.y + event.z;
        // Threshold to consider as movement (you can adjust this value)
      });

      if (acceleration > movementThreshold) {
        isMoving = true;
        print(acceleration);
        notificationService.showNotificationEveryFiveMinutes();
        lastMovementTime = DateTime.now();
      } else if (isMoving == false &&
          DateTime.now().difference(lastMovementTime) < 10.minutes) {}

      isMoving = false;
      notificationService.showNotificationEveryFiveMinutes();

      if (isMoving == false &&
          DateTime.now().difference(lastMovementTime) >= 10.minutes) {
        currentState = "${personPossibleStatuses[selectedId]}";
        Get.offAll(ActivityPage());
      }
    }

    initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color.fromARGB(255, 211, 245, 225),
              Color.fromARGB(255, 132, 255, 226),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Current State is : $state",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Do you want to change your activity ?',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'pacifico',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return ActivityPage();
                },
              ));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text('Change'),
          )
        ],
      ),
    ));
  }
}
