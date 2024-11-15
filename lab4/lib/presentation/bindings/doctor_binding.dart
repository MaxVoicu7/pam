import 'package:get/get.dart';
import '../../data/datasources/local/doctor_local_data_source.dart';
import '../../data/repositories/doctor_repository.dart';
import '../../domain/usecases/get_doctors.dart';
import '../controllers/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorLocalDataSource>(
      () => DoctorLocalDataSourceImpl(),
    );

    Get.lazyPut(() => DoctorRepository(
          localDataSource: Get.find(),
        ));

    Get.lazyPut(() => GetDoctors(
          Get.find(),
        ));

    Get.lazyPut(() => DoctorController(
          getDoctors: Get.find(),
        ));
  }
}
