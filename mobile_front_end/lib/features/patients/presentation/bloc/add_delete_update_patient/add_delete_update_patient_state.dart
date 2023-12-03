part of 'add_delete_update_patient_bloc.dart';

abstract class AddDeleteUpdatePatientState extends Equatable {
  const AddDeleteUpdatePatientState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePatientInitial extends AddDeleteUpdatePatientState {}


class LoadingAddDeleteUpdatePatientState extends AddDeleteUpdatePatientState {}

class ErrorAddDeleteUpdatePatientState extends AddDeleteUpdatePatientState {
  final String message;

  const ErrorAddDeleteUpdatePatientState({required this.message});
  
  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdatePatientState extends AddDeleteUpdatePatientState {
  final String message;

  const MessageAddDeleteUpdatePatientState({required this.message});
  
  @override
  List<Object> get props => [message];
}