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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                '${patient.firstName} ${patient.lastName}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
  }
}


