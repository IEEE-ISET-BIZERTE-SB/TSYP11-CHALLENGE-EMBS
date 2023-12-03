import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/network/network_info.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_local_data_source.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  
  final PatientRemoteDataSource remoteDataSource;
  final PatientLocalDataSource localDataSource;

  PatientRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource, 
    required NetworkInfo networkInfo
  });


    @override
  Future<Either<Failure, List<Patient>>> getAllPatients() {
    // TODO: implement getAllPatients
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Patient>> getOnePatient(int id) {
    // TODO: implement getOnePatient
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> addPatient(Patient patient) {
    // TODO: implement addPatient
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> deletePatient(int id) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, Unit>> updatePatient(Patient patient) {
    // TODO: implement updatePatient
    throw UnimplementedError();
  }



}