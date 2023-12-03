part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPatientsEvent extends PatientsEvent {}
class RefreshPatientsEvent extends PatientsEvent {}

