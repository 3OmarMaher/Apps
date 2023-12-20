import 'package:flutter/material.dart';

import 'package:graduationproject/views/home_controller.dart';
import 'package:graduationproject/widgets/health_card.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({super.key});
  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Health Data',
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          FloatingActionButton(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xff84FFE2),
            onPressed: () => controller.getData(),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.blodGlucoses,
        builder: (context, value, child) {
          return GridView(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              children: [
                for (final bloodGlucose in value)
                  HealthCard(bloodGlucose: bloodGlucose),
              ]);
        },
      ),
    );
  }
}
