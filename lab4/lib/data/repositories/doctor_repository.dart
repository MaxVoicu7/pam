import '../datasources/local/doctor_local_data_source.dart';
import '../../domain/entities/doctor.dart';

class DoctorRepository {
  final DoctorLocalDataSource localDataSource;

  DoctorRepository({required this.localDataSource});

  Future<List<Doctor>> getDoctors() async {
    return await localDataSource.getDoctors();
  }
}
