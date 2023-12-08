import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/snack_bar_message.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import '../../pages/patients_page.dart';
import 'delete_dialog_widget.dart';

class DeletePatientBtnWidget extends StatelessWidget {
  final String patientId;
  const DeletePatientBtnWidget({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => deleteDialog(context, patientId),
      icon: Icon(Icons.delete_outline),
    );
  }

  void deleteDialog(BuildContext context, String patientId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdatePatientBloc,
              AddDeleteUpdatePatientState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePatientState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => PatientsPage(),
                    ),
                    (route) => false);
              } else if (state is ErrorAddDeleteUpdatePatientState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePatientState) {
                return AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(patientId: patientId);
            },
          );
        });
  }
}
