import 'package:get/get.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/usecases/get_doctors.dart';

class DoctorController extends GetxController {
  final GetDoctors getDoctors;

  DoctorController({required this.getDoctors});

  var doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
  }

  void loadDoctors() async {
    try {
      doctors.value = await getDoctors.execute();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading doctors: $e");
    }
  }
}
