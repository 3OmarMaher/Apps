import 'package:flutter/material.dart';

import 'home_page.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff21252B),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 250),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 25, left: 100, right: 100),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(200)),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    // Add your login logic here
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage(state: "Null",);
                      },
                    ));
                  },
                  child: const Text('Rigester'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
