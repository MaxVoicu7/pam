import 'package:get/get.dart';
import 'package:lab2/models/doctor.dart';

class DoctorController extends GetxController {
  var doctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
  }

  void loadDoctors() async {
    try {
      var fetchedDoctors = await DoctorModel.fetchDoctors();
      doctors.value = fetchedDoctors;
    } catch (e) {
      // ignore: avoid_print
      print("Error loading doctors: $e");
    }
  }
}
