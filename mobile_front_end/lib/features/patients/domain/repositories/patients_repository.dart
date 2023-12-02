import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';

abstract class PatientRepository {

  Future<Either<Failure, Unit>> addPatient();
  Future<Either<Failure, Unit>> updatePatient();
  Future<Either<Failure, Unit>> deletePatient();
  Future<Either<Failure, Patient>> getOnePatient();
  Future<Either<Failure, List<Patient>>> getAllPatients();

}