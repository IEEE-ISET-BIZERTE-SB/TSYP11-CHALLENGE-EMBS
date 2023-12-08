import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patient_add_update_page.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patient_detail_page/patient_detail_widget.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/widgets/vital_signs_detail_page/vital_signs_build_widget.dart';

import '../../domain/entities/patient.dart';

class PatientDetailPage extends StatelessWidget {
  final Patient patient;
  const PatientDetailPage({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text("${patient.firstName} ${patient.lastName}"),
      actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientAddUpdatePage(
                isUpdatePatient: true,
                patient: patient,
              ),
                ),
              );
            },
          ),
        ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Container(
          height: 100,
          child: PatientDetailWidget(patient: patient),
        ),
        Container(
          height: 500,
          child: VitalSignsBuildWidget()
        ),
        Container(
          height: 100,
          child: PatientDetailWidget(patient: patient),
        )
      ],
    );
  }
}
