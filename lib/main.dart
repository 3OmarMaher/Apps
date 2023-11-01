import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_instance/src/bindings_interface.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduationproject/services/notification.dart';
//import 'package:graduationproject/views/home_page.dart';
//import 'views/home_page.dart';
import 'views/login_screen.dart';

void main() async {
  

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
        initialBinding: BindingsBuilder(() {}),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen()
       
        );
  }
}
