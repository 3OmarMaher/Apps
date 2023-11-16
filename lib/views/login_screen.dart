import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/activity/helper/show_snack_bar.dart';
import 'package:graduationproject/widgets/custom_form_text_filed.dart';
import 'package:graduationproject/widgets/custtom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(
                fontSize: 26,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/Aspas.jpeg',
                    width: 140,
                    height: 180,
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 27, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFiled(
                      onchange: (data) {
                        email = data;
                      },
                      label: 'Email'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextFiled(
                      onchange: (data) {
                        password = data;
                      },
                      label: 'Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await LoginUser(context);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(
                                context, 'User Not Found , Sign Up First');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (ex) {
                          showSnackBar(context, ex.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        return showSnackBar(context, 'Validation Is Not True');
                      }
                      Navigator.of(context).pushNamed('home');
                    },
                    text: 'Log In',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account ? ",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              color: Color.fromARGB(255, 3, 46, 82),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser(BuildContext context) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    showSnackBar(context, 'Succesed Log In ');
  }
}
