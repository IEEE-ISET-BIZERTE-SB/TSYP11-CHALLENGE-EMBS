part of 'vital_signs_bloc.dart';

abstract class VitalSignsEvent extends Equatable {
  const VitalSignsEvent();

  @override
  List<Object> get props => [];
}

class GetAllVitalSignsEvent extends VitalSignsEvent {
  final String patientId;

  const GetAllVitalSignsEvent({required this.patientId});

   @override
  List<Object> get props => [patientId];
}

class RefreshVitalSignsEvent extends VitalSignsEvent {
  final String patientId;

  const RefreshVitalSignsEvent({required this.patientId});

   @override
  List<Object> get props => [patientId];
}
