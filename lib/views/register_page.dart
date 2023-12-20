import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/activity/helper/componants.dart';
import 'package:graduationproject/activity/helper/constant.dart';
import 'package:graduationproject/views/login_screen.dart';
import 'package:graduationproject/widgets/custom_form_text_filed.dart';
import 'package:graduationproject/widgets/custtom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  //String? email, password, user;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signUp(String firstName, String lastName, String email,
      String password, String username, String birthday) async {
    const String apiUrl = postServerName;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: ({
          "Firstname": firstName,
          "Lastname": lastName,
          "username": username,
          "email": email,
          "password": password,
          "birthday": birthday,
        }),
      );

      if (response.statusCode == 200) {
        // Successfully signed up
        print('Successfully signed up!');
        print(response.statusCode.toString());
        navigaiteTo(context, const LoginPage());
      }
      if (response.statusCode == 400) {
        // User already signed up
        print(response.statusCode.toString());
        showDialog(
          context: context,
          //context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registration Error'),
              content: const Text(
                  'The provided email is already registered. Please log in.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    navigaiteTo(context, const LoginPage());
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Handle other errors
        print(response.statusCode.toString());
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registration Error'),
              content: const Text(
                  'Failed to sign up. Please check your data and try again.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle network or other exceptions
      print(e.toString());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: const Color(0xff3260C5),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Color.fromARGB(255, 211, 245, 225),
                Color.fromARGB(255, 132, 255, 226),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/images/Aspas.jpeg',
                    width: 100,
                    height: 100,
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Username',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  CustomFormTextFiled(
                      myController: user, hint: 'Enter Your Username'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'First Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),

                  CustomFormTextFiled(
                      myController: fName, hint: 'Enter Your First Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Last Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  CustomFormTextFiled(
                      myController: lName, hint: 'Enter Your Last Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Birthday',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  CustomFormTextFiled(
                      myController: birthday, hint: 'in (Y-M-D) Format'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),

                  CustomFormTextFiled(
                      myController: email, hint: 'Enter Your Email'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  CustomFormTextFiled(
                      myController: password,
                      obscure: true,
                      hint: 'Enter Your Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      color: Colors.blue,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          final String fname = fName.text;
                          final String lname = lName.text;
                          final String username = user.text;
                          final String mail = email.text;
                          final String pass = password.text;
                          final String birth = birthday.text;
                          // Show loading indicator
                          isLoading = true;
                          setState(() {});

                          await signUp(
                              fname, lname, username, mail, pass, birth);

                          // Hide loading indicator
                          isLoading = false;
                          setState(() {});
                        }
                      },
                      text: 'Register'),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already have an account ? ",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              color: Color.fromARGB(255, 3, 46, 82),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> registerUser(BuildContext context) async {
  //   final credintial = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: email.text, password: password.text);
  //   FirebaseAuth.instance.currentUser!.sendEmailVerification();
  //   FirebaseAuth.instance.currentUser!.emailVerified
  //       ? showSnackBar(context, 'Log in To Your Account ')
  //       : Navigator.of(context).pushNamed('login');
  //   showSnackBar(context, 'Verify Your Account First');
  // }

  // Future addUserData(String firstName, String lastName, String userName,
  //     String email, int age) async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'first name': firstName,
  //     'last name': lastName,
  //     'username': userName,
  //     'email': email,
  //     'age': age,
  //   });
  // }
}
