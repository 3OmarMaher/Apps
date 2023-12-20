import 'package:flutter/material.dart';
import 'package:graduationproject/activity/health_repository.dart';
import 'package:graduationproject/model/blood_gluce.dart';


class HomeController {
  final repository = HealthRepository();
  final blodGlucoses = ValueNotifier(<BloodGlucose>[]);
 
  Future<void> getData() async {
    blodGlucoses.value = await repository.getBloodGlucose();
    
  }
}
