import 'dart:convert';
import 'package:flutter/services.dart';
import '../../models/doctor_model.dart';

abstract class DoctorLocalDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorLocalDataSourceImpl implements DoctorLocalDataSource {
  @override
  Future<List<DoctorModel>> getDoctors() async {
    final String response =
        await rootBundle.loadString('assets/data/doctors.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}
