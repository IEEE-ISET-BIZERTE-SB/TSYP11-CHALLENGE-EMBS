import 'package:flutter/material.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';

class CurrentVitalSignsWidget extends StatelessWidget {

  final Stream<List<VitalSigns>> vitalSigns;

  const CurrentVitalSignsWidget({
    Key? key,
    required this.vitalSigns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return StreamBuilder<List<VitalSigns>>(
      stream: vitalSigns,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          print(snapshot);
          return MessageDisplayWidget(message: "Failed to fetch vital signs ${snapshot.error}");
        } else if (snapshot.hasData) {
          final vitalSigns = snapshot.data!.first;
            return GridView.count(
              crossAxisCount: 2,
              children: [
                HealthStatBox(
                  icon: Icons.favorite,
                  label: 'Heart Rate',
                  value: vitalSigns.heartRate,
                ),
                HealthStatBox(
                  icon: Icons.air,
                  label: 'Lung Capacity',
                  value: vitalSigns.oxygenLevel,
                ),
                HealthStatBox(
                  icon: Icons.thermostat,
                  label: 'Temperature',
                  value: vitalSigns.temperature,
                ),
                HealthStatBox(
                  icon: Icons.local_hospital,
                  label: 'Blood Sugar',
                  value: vitalSigns.sugarLevel,
                ),
              ],
            );
        } else {
          return LoadingWidget(key: key);
        }
      },
    );
  }
}

class HealthStatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final double value;

  HealthStatBox({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    if (value > 150) {
      backgroundColor = Colors.red;
    } else if (value > 100) {
      backgroundColor = Colors.orange;
    } else {
      backgroundColor = Colors.green;
    }
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Value: $value',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
        
      ),
    );
  }
}
