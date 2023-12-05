import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patient_add_update_page.dart';

import '../../domain/entities/patient.dart';
import '../widgets/patient_detail_page/patient_detail_widget.dart';

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
      title: Text("Patient Detail"),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PatientDetailWidget(patient: patient),
      ),
    );
  }
}
