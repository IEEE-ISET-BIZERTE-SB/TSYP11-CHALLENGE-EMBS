part of 'add_delete_update_patient_bloc.dart';

abstract class AddDeleteUpdatePatientEvent extends Equatable {
  const AddDeleteUpdatePatientEvent();

  @override
  List<Object> get props => [];
}

class AddPatientEvent extends AddDeleteUpdatePatientEvent {
  final Patient patient;

  const AddPatientEvent({required this.patient});

   @override
  List<Object> get props => [patient];
}

class UpdatePatientEvent extends AddDeleteUpdatePatientEvent {
  final Patient patient;

  const UpdatePatientEvent({required this.patient});

   @override
  List<Object> get props => [patient];
}

class DeletePatientEvent extends AddDeleteUpdatePatientEvent {
  final String patientId;

  const DeletePatientEvent({required this.patientId});

   @override
  List<Object> get props => [patientId];
}