import 'dart:ffi';

import 'package:equatable/equatable.dart';

class VitalSigns extends Equatable {
  
  final String? id;
  final String patientId;
  final double heartRate;
  final double oxygenLevel;
  final double sugarLevel;
  final double temperature;

  VitalSigns({
    required this.id, 
    required this.patientId,
    required this.heartRate,
    required this.oxygenLevel,
    required this.sugarLevel,
    required this.temperature
  });
  // final String? photo;

 

  @override
  List<Object?> get props => [id, patientId];
}
