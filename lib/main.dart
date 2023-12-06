import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/firebase_options.dart';
import 'package:graduationproject/services/notification.dart';
import 'package:graduationproject/views/home_page.dart';
import 'package:graduationproject/views/register_page.dart';
import 'views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginPage()
          : MyHomePage(state: 'null'),
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'home': (context) => MyHomePage(state: 'null'),
      },
      initialBinding: BindingsBuilder(() {}),
      debugShowCheckedModeBanner: false,
    );
  }
}
