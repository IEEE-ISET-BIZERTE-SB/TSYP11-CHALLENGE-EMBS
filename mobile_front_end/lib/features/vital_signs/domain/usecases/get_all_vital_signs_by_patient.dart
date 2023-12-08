import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';
import 'package:mobile_front_end/features/vital_signs/domain/repositories/vital_signs_repository.dart';

class GetAllVitalSignsByPatientUsecase {
  final VitalSignsRepository repository;

  GetAllVitalSignsByPatientUsecase(this.repository);

    Stream<List<VitalSigns>> call(String patientId) {
    return repository.getAllVitalSignsByPatient(patientId);
  }
}