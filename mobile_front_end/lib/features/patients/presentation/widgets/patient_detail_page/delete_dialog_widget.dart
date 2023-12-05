import '../../bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final String patientId;
  const DeleteDialogWidget({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you Sure ?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "No",
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdatePatientBloc>(context).add(
              DeletePatientEvent(patientId: patientId),
            );
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}
