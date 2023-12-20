
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationproject/services/notification.dart';
import 'package:graduationproject/views/current_state_page.dart';
import 'package:graduationproject/views/home.dart';
import 'package:graduationproject/views/register_page.dart';
import 'views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

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
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'currentState': (context) => CurrentStatePage(state: 'null'),
        'home': (context) => const HomePage(),
      },
      initialBinding: BindingsBuilder(() {}),
      debugShowCheckedModeBanner: false,
    );
  }
}


