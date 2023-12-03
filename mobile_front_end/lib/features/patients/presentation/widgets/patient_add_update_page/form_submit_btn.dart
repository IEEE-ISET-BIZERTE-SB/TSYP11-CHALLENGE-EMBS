import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatePatient;

  const FormSubmitBtn({
    Key? key,
    required this.onPressed,
    required this.isUpdatePatient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        icon: isUpdatePatient ? Icon(Icons.edit) : Icon(Icons.add),
        label: Text(isUpdatePatient ? "Update" : "Add"));
  }
}
