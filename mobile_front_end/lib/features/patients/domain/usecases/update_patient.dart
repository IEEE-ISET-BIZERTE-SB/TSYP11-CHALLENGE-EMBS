import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class UpdatePatientUsescase {
  final PatientRepository repository;

  UpdatePatientUsescase(this.repository);

  Future<Either<Failure, Unit>> call(Patient patient) async {
    return await repository.updatePatient(patient);
  }
}