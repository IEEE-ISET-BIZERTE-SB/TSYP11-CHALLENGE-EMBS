// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../domain/entities/patient.dart';

class PatientDetailWidget extends StatelessWidget {
  final Patient patient;
  const PatientDetailWidget({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
          Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Set your border color
              width: 1.0,  
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
                Text('${patient.firstName} ${patient.lastName}'),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.assignment_ind, color: Colors.amberAccent),
                    SizedBox(width: 4.0),
                    Text('Matricule: ${patient.matricule}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.pinkAccent),
                    SizedBox(width: 4.0),
                    Text('Room: ${patient.room}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_hotel, color: Colors.deepPurpleAccent),
                    SizedBox(width: 4.0),
                    Text('Bed: ${patient.bed}'),
                  ],
                ),
              ],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ));
  }
}


