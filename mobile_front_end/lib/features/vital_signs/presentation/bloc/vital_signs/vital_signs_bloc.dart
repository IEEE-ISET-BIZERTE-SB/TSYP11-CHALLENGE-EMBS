import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/strings/failures.dart';
import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';
import 'package:mobile_front_end/features/vital_signs/domain/usecases/get_all_vital_signs_by_patient.dart';

part 'vital_signs_event.dart';
part 'vital_signs_state.dart';

class VitalSignsBloc extends Bloc<VitalSignsEvent, VitalSignsState> {
  final GetAllVitalSignsByPatientUsecase getAllVitalSignsByPatient;
  
  VitalSignsBloc(
    {required this.getAllVitalSignsByPatient}
  ) : super(VitalSignsInitial()) {
    on<VitalSignsEvent>((event, emit) {
      if (event is GetAllVitalSignsEvent) {
        emit(LoadingVitalSignsState());

        final failureOrVitalSigns = getAllVitalSignsByPatient(event.patientId);
      
        emit(_mapFailureOrVitalSignsToState(failureOrVitalSigns));
      } else if ( event is RefreshVitalSignsEvent) {
        emit(LoadingVitalSignsState());

        final failureOrVitalSigns = getAllVitalSignsByPatient(event.patientId);
        emit(_mapFailureOrVitalSignsToState(failureOrVitalSigns));
      }
    });
  }
}

 VitalSignsState _mapFailureOrVitalSignsToState(Stream<List<VitalSigns>> vitalSigns) {
    try {
      return LoadedVitalSignsState(vitalSigns: vitalSigns);
      
    } catch (error) {
      return ErrorVitalSignsState(message: _mapFailureToMessage(ServerFailure()));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }

