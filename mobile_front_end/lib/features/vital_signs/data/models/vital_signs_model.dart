import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';

class VitalSignsModel extends VitalSigns {

  
   VitalSignsModel({
    String? id,
    required String patientId,
    required double heartRate,
    required double oxygenLevel,
    required double sugarLevel,
    required double temperature,
  
    })
       : super(
        id: id,
        patientId: patientId ,
        heartRate: heartRate,
        oxygenLevel: oxygenLevel,
        sugarLevel: sugarLevel,
        temperature: temperature,  
      );

  factory VitalSignsModel.fromJson(Map<String, dynamic> json) {
    return VitalSignsModel(
        id: json['id'],
        patientId: json['patientId'],
        heartRate: json['heartRate'],
        oxygenLevel: json['oxygenLevel'],
        sugarLevel: json['sugarLevel'],
        temperature: json['temperature'],
       
      );
  }
}
