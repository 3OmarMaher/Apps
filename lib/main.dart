import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_instance/src/bindings_interface.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduationproject/services/notification.dart';
//import 'package:graduationproject/views/home_page.dart';
//import 'views/home_page.dart';
import 'views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/sign_page.dart';

// Hello omar , let me try..
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  // Create an instance of MyHomePage
  // MyHomePage myHomePage = MyHomePage();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // final MyHomePage homePage;
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(() {}),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen()
        // StepCounter(), // Use the passed instance of MyHomePage
        );
  }
}
