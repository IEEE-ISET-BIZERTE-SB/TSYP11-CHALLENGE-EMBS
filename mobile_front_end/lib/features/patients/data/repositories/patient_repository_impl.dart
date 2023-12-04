import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:mobile_front_end/core/network/network_info.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_local_data_source.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_front_end/features/patients/data/models/patient_model.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPatient();

class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource remoteDataSource;
  final PatientLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PatientRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Stream<Either<Failure, List<Patient>>> getAllPatients() {
    if (networkInfo.isConnected == true) {
      try {
        final remotePatients = remoteDataSource.getAllPatients();
        // localDataSource.cachePatients(remotePatients);
        return Right(remotePatients);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPatients = await localDataSource.getCachedPatients();
        return Right(localPatients);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPatient(Patient patient) async {
    final PatientModel patientModel = PatientModel(      
      matricule: patient.matricule,
      firstName: patient.firstName,
      lastName: patient.lastName,
      room: patient.room,
      bed: patient.bed
    );

    return await _getMessage(() {
      return remoteDataSource.addPatient(patientModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePatient(String patientId) async {
    return await _getMessage(() {
      return remoteDataSource.deletePatient(patientId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePatient(Patient patient) async {
    final PatientModel patientModel =
        PatientModel(
          id: patient.id, 
          matricule: patient.matricule,
          firstName: patient.firstName,
          lastName: patient.lastName,
          room: patient.room,
          bed: patient.bed
        );

    return await _getMessage(() {
      return remoteDataSource.updatePatient(patientModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPatient deleteOrUpdateOrAddPatient) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPatient();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  
  // @override
  // Future<Either<Failure, Patient>> getOnePatient(int id) {
  //   // TODO: implement getOnePatient
  //   throw UnimplementedError();
  // }
}
