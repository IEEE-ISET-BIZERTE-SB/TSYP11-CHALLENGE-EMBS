import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_front_end/core/strings/constants.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../models/patient_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PatientRemoteDataSource {
  Stream<List<PatientModel>> getAllPatients();
  // Future<PatientModel> getOnePatient(String patientId);
  Future<Unit> deletePatient(String patientId);
  Future<Unit> updatePatient(PatientModel patientModel);
  Future<Unit> addPatient(PatientModel patientModel);
}


class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {
final CollectionReference patientCollection = FirebaseFirestore.instance.collection('patient');

  @override
  Stream<List<PatientModel>> getAllPatients() {
    return patientCollection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            final data = doc.data() as dynamic;
            return PatientModel.fromJson(data);
          },
        ).toList();
      },
    );
  }
  
  @override
  Future<Unit> addPatient(PatientModel patientModel) {
    // TODO: implement addPatient
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> deletePatient(String patientId) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> updatePatient(PatientModel patientModel) {
    // TODO: implement updatePatient
    throw UnimplementedError();
  }



  // @override
  // Future<Unit> addPatient(PatientModel patientModel) async {
  //   final body = {
  //     "matricule": patientModel.matricule,
  //     "firstName": patientModel.firstName,
  //     "lastName": patientModel.lastName,
  //     "room": patientModel.room,
  //     "bed": patientModel.bed,
  //   };

  //   final response =
  //       await client.post(Uri.parse("$BASE_URL/patients/"), body: body);

  //   if (response.statusCode == 201) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<Unit> deletePatient(String patientId) async {
  //   final response = await client.delete(
  //     Uri.parse("$BASE_URL/patients/${patientId.toString()}"),
  //     headers: {"Content-Type": "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<Unit> updatePatient(PatientModel PatientModel) async {
  //   final patientId = PatientModel.id.toString();
  //   final body = {
  //     "matricule": PatientModel.matricule,
  //     "firstName": PatientModel.firstName,
  //     "lastName": PatientModel.lastName,
  //     "room": PatientModel.room,
  //     "bed": PatientModel.bed,
  //   };

  //   final response = await client.patch(
  //     Uri.parse("$BASE_URL/patients/$patientId"),
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }
  
}
