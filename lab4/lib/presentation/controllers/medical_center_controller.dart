import 'package:get/get.dart';
import '../../domain/entities/medical_center.dart';
import '../../domain/usecases/get_medical_centers.dart';

class MedicalCenterController extends GetxController {
  final GetMedicalCenters getMedicalCenters;

  MedicalCenterController({required this.getMedicalCenters});

  var medicalCenters = <MedicalCenter>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicalCenters();
  }

  void loadMedicalCenters() async {
    try {
      medicalCenters.value = await getMedicalCenters.execute();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading medical centers: $e");
    }
  }
}
