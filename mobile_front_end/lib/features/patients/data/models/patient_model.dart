import '../../domain/entities/patient.dart';

class PatientModel extends Patient {

  
  const PatientModel({
    String? id,
    required String matricule, 
    required String firstName, 
    required String lastName, 
    required String room,
    required String bed   
    })
      : super(
        id: id,
        matricule: matricule,
        firstName: firstName,
        lastName: lastName,
        room: room,
        bed: bed        
      );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
        id: json['id'],
        matricule: json['matricule'], 
        firstName: json['firstName'],
        lastName: json['lastName'],
        room: json['room'],
        bed: json['bed']
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matricule': matricule,
      'firsName': firstName,
      'lastName': lastName,
      'room': room,
      'bed': bed
    };
  }
}
