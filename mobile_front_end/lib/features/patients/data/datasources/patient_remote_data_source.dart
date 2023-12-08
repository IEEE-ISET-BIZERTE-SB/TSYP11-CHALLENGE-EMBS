import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../models/patient_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientRemoteDataSource {
  Future<List<PatientModel>> getAllPatients();
  Future<Unit> deletePatient(String patientId);
  Future<Unit> updatePatient(PatientModel patientModel);
  Future<Unit> addPatient(PatientModel patientModel);
}


class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {
final CollectionReference patientCollection;

  PatientRemoteDataSourceImpl({required this.patientCollection});

  @override
  Future<List<PatientModel>> getAllPatients() async {
      final snapshot = await patientCollection.get();
      if (snapshot.docs.isNotEmpty) {
        final allData = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
        
      final List<PatientModel> patientModels = allData
      .map<PatientModel>((jsonPostModel) => PatientModel.fromJson(jsonPostModel))
      .toList();

      return patientModels;
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
    };

    bool response = false;
    await patientCollection.add(body).then((value) => 
      response = true
    );

    if (response) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePatient(String patientId) async {
    
    bool response = false;
    await patientCollection.doc(patientId).delete().then((value) => 
     response = true
    );

    if (response) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePatient(PatientModel PatientModel) async {
    final patientId = PatientModel.id;
    final body = {
      "matricule": PatientModel.matricule,
      "firstName": PatientModel.firstName,
      "lastName": PatientModel.lastName,
      "room": PatientModel.room,
      "bed": PatientModel.bed,
    };

    bool response = false;
    
    await patientCollection.doc(patientId)
    .update(body).then((value) => 
    response = true
    );

    if (response) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
  
}
