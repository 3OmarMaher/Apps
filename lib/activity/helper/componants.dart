import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// class Curd {
//   postReqest(String url, Map data) async {
//     try {
//       var response = await http.post(Uri.parse(url), body: data);
//       if (response.statusCode == 200) {
//         var responsebody = jsonDecode(response.body);
//         return responsebody;
//       } else {
//         print("error${response.statusCode}");
//       }
//     } catch (e) {
//       print("erroe$e");
//     }
//   }
// }

void navigaiteTo(BuildContext context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);
