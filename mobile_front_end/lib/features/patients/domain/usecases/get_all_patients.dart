import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class GetAllPatientsUsescase {
  final PatientRepository repository;

  GetAllPatientsUsescase(this.repository);

  Future<Either<Failure, List<Patient>>> call() async {
    return await repository.getAllPatients();
  }
}