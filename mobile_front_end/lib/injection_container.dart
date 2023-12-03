import 'package:mobile_front_end/features/patients/data/datasources/patient_local_data_source.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_front_end/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/patients/patients_bloc.dart';

import 'core/network/network_info.dart';

import 'features/patients/domain/usecases/add_patient.dart';
import 'features/patients/domain/usecases/delete_patient.dart';
import 'features/patients/domain/usecases/get_all_patients.dart';
import 'features/patients/domain/usecases/update_patient.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - patients

// Bloc

  sl.registerFactory(() => PatientsBloc(getAllPatients: sl()));
  sl.registerFactory(() => AddDeleteUpdatePatientBloc(
      addPatient: sl(), updatePatient: sl(), deletePatient: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllPatientsUsecase(sl()));
  sl.registerLazySingleton(() => AddPatientUsecase(sl()));
  sl.registerLazySingleton(() => DeletePatientUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePatientUsecase(sl()));

// Repository

  sl.registerLazySingleton<PatientRepository>(() => PatientRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PatientRemoteDataSource>(
      () => PatientRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PatientLocalDataSource>(
      () => PatientLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
