import 'dart:convert';
import 'package:flutter/services.dart';
import '../../models/medical_center_model.dart';

abstract class MedicalCenterLocalDataSource {
  Future<List<MedicalCenterModel>> getMedicalCenters();
}

class MedicalCenterLocalDataSourceImpl implements MedicalCenterLocalDataSource {
  @override
  Future<List<MedicalCenterModel>> getMedicalCenters() async {
    final String response =
        await rootBundle.loadString('assets/data/medical_centers.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => MedicalCenterModel.fromJson(json)).toList();
  }
}
