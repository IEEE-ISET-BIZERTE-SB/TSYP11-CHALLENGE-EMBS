import 'package:flutter/material.dart';

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
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("Patient Detail"),
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
