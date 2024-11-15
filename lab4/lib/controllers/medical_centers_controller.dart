import 'package:get/get.dart';
import 'package:lab2/models/medical_center.dart';

class MedicalCenterController extends GetxController {
  var medicalCenters = <MedicalCenterModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicalCenters();
  }

  void loadMedicalCenters() async {
    try {
      var centers = await MedicalCenterModel.fetchMedicalCenters();
      medicalCenters.value = centers;
    } catch (e) {
      // ignore: avoid_print
      print("Error loading medical centers: $e");
    }
  }
}
