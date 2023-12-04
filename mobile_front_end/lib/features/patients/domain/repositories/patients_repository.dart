import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';

abstract class PatientRepository {

  Stream<Either<Failure, List<Patient>>> getAllPatients();
  Future<Either<Failure, Unit>> addPatient(Patient patient);
  Future<Either<Failure, Unit>> updatePatient(Patient patient);
  Future<Either<Failure, Unit>> deletePatient(String id);

}