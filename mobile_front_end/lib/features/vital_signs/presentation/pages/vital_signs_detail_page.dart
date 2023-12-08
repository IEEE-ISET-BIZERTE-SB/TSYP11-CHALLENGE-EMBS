import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';


class PatientDetailPage extends StatelessWidget {
  final VitalSigns vitalSigns;
  const PatientDetailPage({
    Key? key,
    required this.vitalSigns,
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
      title: Text("Vital Signs Detail"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        // child: PatientDetailWidget(patient: patient),
      ),
    );
  }
}
