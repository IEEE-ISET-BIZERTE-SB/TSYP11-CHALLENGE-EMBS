import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/strings/failures.dart';
import 'package:mobile_front_end/core/strings/messages.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/domain/usecases/add_patient.dart';
import 'package:mobile_front_end/features/patients/domain/usecases/delete_patient.dart';
import 'package:mobile_front_end/features/patients/domain/usecases/update_patient.dart';

part 'add_delete_update_patient_event.dart';
part 'add_delete_update_patient_state.dart';

class AddDeleteUpdatePatientBloc extends Bloc<AddDeleteUpdatePatientEvent, AddDeleteUpdatePatientState> {
  
  final AddPatientUsecase addPatient;
  final DeletePatientUsecase deletePatient;
  final UpdatePatientUsecase updatePatient;

  AddDeleteUpdatePatientBloc({
    required this.addPatient,
    required this.deletePatient,
    required this.updatePatient
  }) : super(AddDeleteUpdatePatientInitial()) {
    on<AddDeleteUpdatePatientEvent>((event, emit) async {
      if (event is AddPatientEvent) {
        emit(LoadingAddDeleteUpdatePatientState());

        final failureOrDoneMessage = await addPatient(event.patient);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is UpdatePatientEvent) {
        emit(LoadingAddDeleteUpdatePatientState());

        final failureOrDoneMessage = await updatePatient(event.patient);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE),
        );
      } else if (event is DeletePatientEvent) {
        emit(LoadingAddDeleteUpdatePatientState());

        final failureOrDoneMessage = await deletePatient(event.patientId);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, DELETE_SUCCESS_MESSAGE),
        );
      }
    });
  }

  AddDeleteUpdatePatientState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteUpdatePatientState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddDeleteUpdatePatientState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
