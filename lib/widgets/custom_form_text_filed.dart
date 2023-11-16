import 'package:flutter/material.dart';

class CustomFormTextFiled extends StatelessWidget {
  CustomFormTextFiled({super.key, this.onchange, required this.label});
  final String label;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Invalid Value ';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
