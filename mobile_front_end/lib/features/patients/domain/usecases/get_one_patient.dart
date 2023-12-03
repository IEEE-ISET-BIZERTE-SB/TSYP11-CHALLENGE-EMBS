import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class GetOnePatientUsescase {
  final PatientRepository repository;

  GetOnePatientUsescase(this.repository);

  Future<Either<Failure, Patient>> call(int patientId) async {
    return await repository.getOnePatient(patientId);
  }
}