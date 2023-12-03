import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/strings/failures.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/usecases/get_all_patients.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  final GetAllPatientsUsecase getAllPatients;

  PatientsBloc({
    required this.getAllPatients,
  }) : super(PatientsInitial()) {
    on<PatientsEvent>((event, emit) async {
      if (event is GetAllPatientsEvent) {
        emit(LoadingPatientsState());

        final failureOrPatients = await getAllPatients();
        emit(_mapFailureOrPatientsToState(failureOrPatients));
      } else if ( event is RefreshPatientsEvent) {
        emit(LoadingPatientsState());

        final failureOrPatients = await getAllPatients();
        emit(_mapFailureOrPatientsToState(failureOrPatients));
      }
    });
  }

  PatientsState _mapFailureOrPatientsToState(Either<Failure, List<Patient>> either) {
    return either.fold((failure) =>
          ErrorPatientsState(message: _mapFailureToMessage(failure))
        , (patients) =>
          LoadedPatientsState(patients: patients)
        );
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
}
