import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';

import '../../../../core/widgets/loading_widget.dart';
import 'patients_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/snack_bar_message.dart';
import '../bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import '../widgets/patient_add_update_page/form_widget.dart';

class PatientAddUpdatePage extends StatelessWidget {
  final Patient? patient;
  final bool isUpdatePatient;
  const PatientAddUpdatePage({Key? key, 
    this.patient, 
    required this.isUpdatePatient
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePatient ? "Edit Patient" : "Add Patient"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10),
          child:
              BlocConsumer<AddDeleteUpdatePatientBloc, AddDeleteUpdatePatientState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePatientState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => PatientsPage()),
                    (route) => false);
              } else if (state is ErrorAddDeleteUpdatePatientState) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePatientState) {
                return LoadingWidget();
              }

              return FormWidget(
                  isUpdatePatient: isUpdatePatient, patient: isUpdatePatient ? patient : null);
            },
          )),
    );
  }
}
