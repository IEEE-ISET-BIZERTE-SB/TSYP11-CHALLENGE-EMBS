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
          print(snapshot);
          return MessageDisplayWidget(message: "Failed to fetch vital signs ${snapshot.error}");
        } else if (snapshot.hasData) {
          final vitalSignsList = snapshot.data!.first;
          // return ListView.builder(
          //   itemCount: vitalSignsList.length,
          //   itemBuilder: (context, index) {
              final vitalSigns = vitalSignsList;
              return ListTile(
                title: Text(vitalSigns.patientId),
                subtitle: Text(vitalSigns.heartRate.toString()),
              );
            // },
          // );
        } else {
          return LoadingWidget(key: key);
        }
      },
    );
  }
}
