import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/activity/helper/show_snack_bar.dart';
import 'package:graduationproject/widgets/custom_form_text_filed.dart';
import 'package:graduationproject/widgets/custtom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  //String? email, password, user;

   TextEditingController user = TextEditingController();
   TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/Aspas.jpeg',
                    width: 100,
                    height: 100,
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sign Up To Using The App',
                    style: TextStyle(fontSize: 17, color: Colors.grey[600]),
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
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFiled(
                    myController: user,
                      // onchange: (data) {
                      //   user = data;
                      // },
                      hint: 'Enter Your Username'),
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
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFiled(
                    myController: email,
                      // onchange: (data) {
                      //   email = data;
                      // },
                      hint: 'Enter Your Email'),
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
                      // onchange: (data) {
                      //   password = data;
                      // },
                      hint: 'Enter Your Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      color: Colors.blue,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser(context);
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak-password') {
                              showSnackBar(context, 'Password Is Weak');
                            } else if (ex.code == 'email-already-in-use') {
                              showSnackBar(context, 'Email is Already Exists');
                            }
                          } catch (ex) {
                            showSnackBar(context, ex.toString());
                          }
                          isLoading = false;
                          setState(() {});
                        } else {
                          return showSnackBar(
                              context, 'Validation Is Not True');
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    final  credintial = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: password.text);
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    FirebaseAuth.instance.currentUser!.emailVerified
        ? showSnackBar(context, 'Log in To Your Account ')
        : Navigator.of(context).pushNamed('login');
    showSnackBar(context, 'Verify Your Account First');
  }
}
