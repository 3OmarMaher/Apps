import 'package:flutter/material.dart';

class CustomFormTextFiled extends StatelessWidget {
  CustomFormTextFiled({super.key, this.onchange, required this.hint,  this.obscure= false, required this.myController,});
  final String hint;
  Function(String)? onchange;
  final bool obscure;
  final TextEditingController myController; 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Invalid Value ';
        }
        return null;
      },
      controller: myController,
      obscureText: obscure,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
