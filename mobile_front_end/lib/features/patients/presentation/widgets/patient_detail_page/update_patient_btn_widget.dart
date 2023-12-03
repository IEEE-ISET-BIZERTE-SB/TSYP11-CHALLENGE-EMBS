import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';

import '../../pages/patient_add_update_page.dart';

class UpdatePatientBtnWidget extends StatelessWidget {
  final Patient patient;
  const UpdatePatientBtnWidget({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PatientAddUpdatePage(
                isUpdatePatient: true,
                patient: patient,
              ),
            ));
      },
      icon: Icon(Icons.edit),
      label: Text("Edit"),
    );
  }
}
