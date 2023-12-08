// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/vital_signs/domain/entities/vital_signs.dart';

class VitalSignsStreamWidget extends StatelessWidget {
  final Stream<List<VitalSigns>> vitalSigns;

  const VitalSignsStreamWidget({
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
          return MessageDisplayWidget(message: "Failed to fetch vital signs ${snapshot.error}");
        } else if (snapshot.hasData) {
          return Container();
          // final vitalSignsList = snapshot.data!;

          // double i = 0;
          // // Extract heart rate data
          // final List<FlSpot> heartRateData = vitalSignsList
          //     .asMap()
          //     .entries
          //     .map((entry) => FlSpot(i++, entry.value.heartRate))
          //     .toList();

          // return LineChart(
          //   LineChartData(
          //     lineBarsData: [
          //       LineChartBarData(
          //         spots: heartRateData,
          //         isCurved: true,
          //         belowBarData: BarAreaData(show: false),
          //         dotData: FlDotData(show: false),
          //         color: Colors.blue,
          //         barWidth: 4,
          //         isStrokeCapRound: true,
          //       ),
          //     ],
          //     borderData: FlBorderData(
          //       show: true,
          //       border: Border.all(color: const Color(0xff37434d), width: 1),
          //     ),
          //     gridData: FlGridData(
          //       show: true,
          //       horizontalInterval: 1,
          //     ),
          //   ),
          // );
        } else {
          return LoadingWidget(key: key);
        }
      },
    );
  }
}
