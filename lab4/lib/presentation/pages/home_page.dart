import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import '../controllers/doctor_controller.dart';
import '../controllers/main_card_controller.dart';
import '../controllers/medical_center_controller.dart';
import '../widgets/categories_widget.dart';
import '../widgets/doctors_widget.dart';
import '../widgets/main_cards_carousel.dart';
import '../widgets/medical_centers_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/search_doctor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCardController = Get.find<MainCardController>();
    final categoryController = Get.find<CategoryController>();
    final medicalCenterController = Get.find<MedicalCenterController>();
    final doctorController = Get.find<DoctorController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LocationWidget(),
            const SearchDoctor(),
            Obx(() {
              if (mainCardController.mainCards.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return const MainCardsCarousel();
            }),
            Obx(() {
              if (categoryController.categories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return CategoriesWidget(
                categories: categoryController.categories,
              );
            }),
            Obx(() {
              if (medicalCenterController.medicalCenters.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return MedicalCentersWidget(
                medicalCenters: medicalCenterController.medicalCenters,
              );
            }),
            Obx(() {
              if (doctorController.doctors.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return DoctorsWidget(
                doctors: doctorController.doctors,
              );
            }),
          ],
        ),
      ),
    );
  }
}
