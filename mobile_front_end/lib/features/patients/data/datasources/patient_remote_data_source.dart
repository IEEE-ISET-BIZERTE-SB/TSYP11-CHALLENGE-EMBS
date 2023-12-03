import 'dart:convert';

import '../../../../core/exceptions/exceptions.dart';
import '../models/patient_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PatientRemoteDataSource {
  Future<List<PatientModel>> getAllPatients();
  Future<PatientModel> getOnePatient(int patientId);
  Future<Unit> deletePatient(int patientId);
  Future<Unit> updatePatient(PatientModel patientModel);
  Future<Unit> addPatient(PatientModel patientModel);
}

const BASE_URL = "https://";

class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {
  final http.Client client;

  PatientRemoteDataSourceImpl({
    required this.client
  });
 
  @override
  Future<List<PatientModel>> getAllPatients() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/patients/"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PatientModel> patientModels = decodedJson
          .map<PatientModel>((jsonPatientModel) => PatientModel.fromJson(jsonPatientModel))
          .toList();

      return patientModels;
    } else {
      throw ServerException();
    }
  }


  @override
  Future<PatientModel> getOnePatient(int patientId) async {
    final response = await client.get(
      Uri.parse("$BASE_URL/patients/${patientId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final PatientModel patientModel = PatientModel.fromJson(decodedJson);

      return Future.value(patientModel);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPatient(PatientModel patientModel) async {
    final body = {
      "matricule": patientModel.matricule,
      "firstName": patientModel.firstName,
      "lastName": patientModel.lastName,
      "room": patientModel.room,
      "bed": patientModel.bed,
      "photo": patientModel.photo,
    };

    final response =
        await client.post(Uri.parse("$BASE_URL/patients/"), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePatient(int patientId) async {
    final response = await client.delete(
      Uri.parse("$BASE_URL/patients/${patientId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePatient(PatientModel PatientModel) async {
    final patientId = PatientModel.id.toString();
    final body = {
      "matricule": PatientModel.matricule,
      "firstName": PatientModel.firstName,
      "lastName": PatientModel.lastName,
      "room": PatientModel.room,
      "bed": PatientModel.bed,
      "photo": PatientModel.photo,
    };

    final response = await client.patch(
      Uri.parse("$BASE_URL/patients/$patientId"),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
  
}
