import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patient_add_update_page.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patient_detail_page/delete_patient_btn_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patient_detail_page/patient_detail_widget.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/widgets/vital_signs_detail_page/vital_signs_build_widget.dart';

import '../../domain/entities/patient.dart';

class PatientDetailPage extends StatelessWidget {
  final Patient patient;
  const PatientDetailPage({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text("${patient.firstName} ${patient.lastName}"),
      actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientAddUpdatePage(
                isUpdatePatient: true,
                patient: patient,
              ),
                ),
              );
            },
          ),
          DeletePatientBtnWidget(patientId: patient.id!)
        ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          child: PatientDetailWidget(patient: patient),
        ),
        Container(
          height: 400,
          child: VitalSignsBuildWidget()
        ),
         Padding(
           padding: const EdgeInsets.all(15),
           child: Container(
            height: 100,
             child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        iconSize: MaterialStatePropertyAll(
                          40
                        ),
                        alignment: Alignment.center,
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(
                            fontSize: 20
                          )
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(8.0)),
                      ),
                      onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PatientAddUpdatePage(
                        isUpdatePatient: true,
                        patient: patient,
                      ),
                        ),
                      );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.medication_outlined),
                          Text("Medication")
                        ]
                      ),
                      
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        iconSize: MaterialStatePropertyAll(
                          40
                        ),
                        alignment: Alignment.center,
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(
                            fontSize: 20
                          )
                        ),
                        padding: MaterialStatePropertyAll(EdgeInsets.all(8.0)),
                      ),
                      onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PatientAddUpdatePage(
                        isUpdatePatient: true,
                        patient: patient,
                      ),
                        ),
                      );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.medical_information_outlined),
                          Text("Record")
                        ]
                      ),
                      
                    ),
                   
                ]
                ),
           ),
         )

      ],
    );
  }
}
