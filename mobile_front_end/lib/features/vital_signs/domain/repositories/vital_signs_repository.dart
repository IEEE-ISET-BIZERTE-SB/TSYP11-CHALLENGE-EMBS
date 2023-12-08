import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';

abstract class VitalSignsRepository {

  Stream<List<VitalSigns>> getAllVitalSignsByPatient(String patientId);
  
}