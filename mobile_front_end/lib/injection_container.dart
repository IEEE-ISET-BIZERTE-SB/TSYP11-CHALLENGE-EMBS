import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_front_end/features/auth/data/datasources/user_local_data_source.dart';
import 'package:mobile_front_end/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile_front_end/features/auth/data/repositories/UserRepositoryImpl.dart';
import 'package:mobile_front_end/features/auth/domain/repositories/userRepository.dart';
import 'package:mobile_front_end/features/auth/domain/usecases/get_cached_user_use_case.dart';
import 'package:mobile_front_end/features/auth/domain/usecases/sign_in_user_use_case.dart';
import 'package:mobile_front_end/features/auth/domain/usecases/sign_out_user_use_case.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_local_data_source.dart';
import 'package:mobile_front_end/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_front_end/features/patients/data/repositories/patient_repository_impl.dart';
import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/patients/patients_bloc.dart';
import 'package:mobile_front_end/features/vital_signs/data/datasources/vital_signs_remote_data_source.dart';
import 'package:mobile_front_end/features/vital_signs/data/repositories/vital_signs_repository_impl.dart';
import 'package:mobile_front_end/features/vital_signs/domain/repositories/vital_signs_repository.dart';
import 'package:mobile_front_end/features/vital_signs/domain/usecases/get_all_vital_signs_by_patient.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/bloc/vital_signs/vital_signs_bloc.dart';
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
  sl.registerFactory(() => VitalSignsBloc(getAllVitalSignsByPatient: sl()));
  sl.registerFactory(() => AddDeleteUpdatePatientBloc(
      addPatient: sl(), updatePatient: sl(), deletePatient: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllPatientsUsecase(sl()));
  sl.registerLazySingleton(() => GetAllVitalSignsByPatientUsecase(sl()));
  sl.registerLazySingleton(() => AddPatientUsecase(sl()));
  sl.registerLazySingleton(() => DeletePatientUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePatientUsecase(sl()));

// Repository

  sl.registerLazySingleton<PatientRepository>(() => PatientRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<VitalSignsRepository>(() => VitalSignsRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PatientRemoteDataSource>(() =>
      PatientRemoteDataSourceImpl(
          patientCollection: FirebaseFirestore.instance.collection('patient')));
  sl.registerLazySingleton<PatientLocalDataSource>(
      () => PatientLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<VitalSignsRemoteDataSource>(
      () => VitalSignsRemoteDataSourceImpl(vitalSignsCollection: FirebaseFirestore.instance.collection('vitalSigns')));
 
//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(
      () => AuthBloc(signInUserUseCase: sl(), signOutUserUseCase: sl()));

  sl.registerLazySingleton(() => SignInUserUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUserUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      userLocalDataSource: sl(),
      userRemoteDataSource: sl(),
      networtkInfo: sl()));

  // Datasources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));
}
