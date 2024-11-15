import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/bindings/category_binding.dart';
import 'presentation/bindings/doctor_binding.dart';
import 'presentation/bindings/main_card_binding.dart';
import 'presentation/bindings/medical_center_binding.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: HomeBinding(),
      home: const HomePage(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    CategoryBinding().dependencies();
    DoctorBinding().dependencies();
    MainCardBinding().dependencies();
    MedicalCenterBinding().dependencies();
  }
}
