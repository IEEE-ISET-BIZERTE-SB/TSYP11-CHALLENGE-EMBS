import 'package:mobile_front_end/features/patients/domain/repositories/patients_repository.dart';

class GetAllPatientsUsecase {
  final PatientRepository repository;

  GetAllPatientsUsecase(this.repository);

   call() async {
    return await repository.getAllPatients();
  }
}