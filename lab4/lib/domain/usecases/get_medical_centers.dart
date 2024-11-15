import '../entities/medical_center.dart';
import '../../data/repositories/medical_center_repository.dart';

class GetMedicalCenters {
  final MedicalCenterRepository repository;

  GetMedicalCenters(this.repository);

  Future<List<MedicalCenter>> execute() async {
    return await repository.getMedicalCenters();
  }
}
