import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class DeletePatientUsescase {
  final PatientRepository repository;

  DeletePatientUsescase(this.repository);

  Future<Either<Failure, Unit>> call(int patientId) async {
    return await repository.deletePatient(patientId);
  }
}