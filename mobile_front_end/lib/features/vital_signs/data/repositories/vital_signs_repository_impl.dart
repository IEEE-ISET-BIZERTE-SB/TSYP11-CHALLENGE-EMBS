
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:mobile_front_end/core/network/network_info.dart';
import 'package:mobile_front_end/features/vital_signs/data/datasources/vital_signs_remote_data_source.dart';
import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';
import 'package:mobile_front_end/features/vital_signs/domain/repositories/vital_signs_repository.dart';


class VitalSignsRepositoryImpl implements VitalSignsRepository {
  final VitalSignsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  VitalSignsRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo});

  @override
  Stream<List<VitalSigns>> getAllVitalSignsByPatient(String patientId) {
    try {
      final remoteVitalSigns = remoteDataSource.getAllVitalSignsByPatient(patientId);
      return remoteVitalSigns;
    } catch (error) {
      throw ServerException();
    }
  }

}