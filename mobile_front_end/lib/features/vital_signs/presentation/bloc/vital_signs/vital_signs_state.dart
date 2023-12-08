part of 'vital_signs_bloc.dart';

abstract class VitalSignsState extends Equatable {
  const VitalSignsState();
  
  @override
  List<Object> get props => [];
}

final class VitalSignsInitial extends VitalSignsState {}

class LoadingVitalSignsState extends VitalSignsState {}

class LoadedVitalSignsState extends VitalSignsState {
  final Stream<List<VitalSigns>> vitalSigns;

  const LoadedVitalSignsState({required this.vitalSigns});

   @override
  List<Object> get props => [vitalSigns];
}

class ErrorVitalSignsState extends VitalSignsState {
  final String message;

  const ErrorVitalSignsState({required this.message});

   @override
  List<Object> get props => [message];
}
