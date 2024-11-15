import 'package:get/get.dart';
import '../../data/datasources/local/medical_center_local_data_source.dart';
import '../../data/repositories/medical_center_repository.dart';
import '../../domain/usecases/get_medical_centers.dart';
import '../controllers/medical_center_controller.dart';

class MedicalCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalCenterLocalDataSource>(
      () => MedicalCenterLocalDataSourceImpl(),
    );

    Get.lazyPut(() => MedicalCenterRepository(
          localDataSource: Get.find(),
        ));

    Get.lazyPut(() => GetMedicalCenters(
          Get.find(),
        ));

    Get.lazyPut(() => MedicalCenterController(
          getMedicalCenters: Get.find(),
        ));
  }
}
