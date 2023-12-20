import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
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

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                    'Login',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Login To Using The App',
                    style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
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
                    hint: 'Enter Your Email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextFiled(
                      obscure: true,
                      myController: password,
                      // onchange: (data) {
                      //   password = data;
                      // },
                      hint: 'Enter Your Password'),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        if (email.text == "") {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning',
                            desc: ' Please Enter Your Email First ',
                          ).show();

                          return;
                        }

                        try {
                          
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                          title: 'done',
                            desc:
                                'A message has been sent to change your account password',
                          ).show();
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Wrong Email',
                          ).show();
                        }
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
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
                        
                        }  catch (e) {
                            {
                            showSnackBar(context,
                                ' Maybe User Not Found, or Password incorrect , Validate');
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        //when the user click on login without input values in
                        //text form fild
                        return showSnackBar(context, 'Validation Is Not True');
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  MaterialButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    color: Colors.red[900],
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login With Google ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Image.asset(
                          'assets/images/Google_logo.png',
                          width: 20,
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ? ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Color.fromARGB(255, 19, 99, 204),
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> loginUser(BuildContext context) async {
  //   final credential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email.text, password: password.text);
  //   if (credential.user!.emailVerified) {
  //     showSnackBar(context, 'Succesed Log In ');
  //     Navigator.of(context).pushNamed('home');
  //   } else {
  //     showSnackBar(context, 'Check Your Email To Verified');
  //   }
  // }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
   
    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // // );

    // Once signed in, return the UserCredential
    
    Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  }


}
