import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../models/patient_model.dart';

abstract class PatientLocalDataSource {
  Future<List<PatientModel>> getCachedPatients();
  Future<Unit> cachePatients(List<PatientModel> patientModels);
}

const CACHED_PATIENTS = "CACHED_PATIENTS";

class PostLocalDataSourceImpl implements PatientLocalDataSource {

  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({
    required this.sharedPreferences
  });

   @override
  Future<List<PatientModel>> getCachedPatients() {
    final jsonString = sharedPreferences.getString(CACHED_PATIENTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PatientModel> jsonToPatientModels = decodeJsonData
          .map<PatientModel>((jsonPatientModel) => PatientModel.fromJson(jsonPatientModel))
          .toList();
      return Future.value(jsonToPatientModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cachePatients(List<PatientModel> patientModels) {
    List patientModelsToJson = patientModels
        .map<Map<String, dynamic>>((patientModel) => patientModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_PATIENTS, json.encode(patientModelsToJson));
    return Future.value(unit);
  }

 
}
