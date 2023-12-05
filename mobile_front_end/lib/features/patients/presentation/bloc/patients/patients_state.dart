part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();
  
  @override
  List<Object> get props => [];
}

final class PatientsInitial extends PatientsState {}

class LoadingPatientsState extends PatientsState {}

class LoadedPatientsState extends PatientsState {
  final List<Patient> patients;

  const LoadedPatientsState({required this.patients});

   @override
  List<Object> get props => [patients];
}

class ErrorPatientsState extends PatientsState {
  final String message;

  const ErrorPatientsState({required this.message});

   @override
  List<Object> get props => [message];
}
