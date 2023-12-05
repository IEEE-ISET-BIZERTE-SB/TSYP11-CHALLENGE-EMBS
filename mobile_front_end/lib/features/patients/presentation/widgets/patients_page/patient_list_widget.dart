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
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Set your border color
              width: 1.0,          // Set your border width
            ),
          ),
          child: ListTile(
            leading: Container(
              width: 100,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/defaultProfile.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            trailing: Container(
              child: Icon(
                Icons.monitor_heart_outlined,
                color: Colors.greenAccent,
                size: 60.0,
              ),
            ),
            title: Row(
              children: [
                Icon(Icons.sick, color: Colors.blue),
                SizedBox(width: 8.0),
                Text('${patients[index].firstName} ${patients[index].lastName}'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.assignment_ind, color: Colors.amberAccent),
                    SizedBox(width: 4.0),
                    Text('Matricule: ${patients[index].matricule}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.pinkAccent),
                    SizedBox(width: 4.0),
                    Text('Room: ${patients[index].room}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_hotel, color: Colors.deepPurpleAccent),
                    SizedBox(width: 4.0),
                    Text('Bed: ${patients[index].bed}'),
                  ],
                ),
              ],
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
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 0),
    );
  }
}
