import 'update_patient_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/patient.dart';
import 'delete_patient_btn_widget.dart';

class PatientDetailWidget extends StatelessWidget {
  final Patient patient;
  const PatientDetailWidget({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            patient.firstName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text(
            patient.lastName,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePatientBtnWidget(patient: patient),
              DeletePatientBtnWidget(patientId: patient.id!)
            ],
          )
        ],
      ),
    );
  }
}


