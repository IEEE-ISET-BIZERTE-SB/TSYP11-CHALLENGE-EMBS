import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/patient_detail_page.dart';

class PatientListWidget extends StatelessWidget {
  final List<Patient> patients;
  const PatientListWidget({
    Key? key,
    required this.patients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(patients[index].id.toString()),
          title: Text(
            patients[index].firstName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            patients[index].lastName,
            style: TextStyle(fontSize: 16),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PatientDetailPage(patient: patients[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
