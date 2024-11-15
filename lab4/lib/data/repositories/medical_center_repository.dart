import '../datasources/local/medical_center_local_data_source.dart';
import '../../domain/entities/medical_center.dart';

class MedicalCenterRepository {
  final MedicalCenterLocalDataSource localDataSource;

  MedicalCenterRepository({required this.localDataSource});

  Future<List<MedicalCenter>> getMedicalCenters() async {
    return await localDataSource.getMedicalCenters();
  }
}
