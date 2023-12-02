import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final int? id;
  final String matricule;
  final String firstName;
  final String lastName;
  final String room;
  final String bed;
  final String? photo;

  const Patient({
    this.id, 
    required this.matricule, 
    required this.firstName, 
    required this.lastName, 
    required this.room,
    required this.bed,
    this.photo = "/public/images/defaultProfile.png"
    });

  @override
  List<Object?> get props => [id, matricule, firstName, lastName, room, bed];
}
