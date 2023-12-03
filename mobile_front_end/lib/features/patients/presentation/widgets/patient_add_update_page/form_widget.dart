import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';

import '../../bloc/add_delete_update_patient/add_delete_update_patient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_submit_btn.dart';
import 'text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePatient;
  final Patient? patient;
  const FormWidget({
    Key? key,
    required this.isUpdatePatient,
    this.patient,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePatient) {
      _firstNameController.text = widget.patient!.firstName;
      _lastNameController.text = widget.patient!.lastName;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
                name: "First Name", multiLines: false, controller: _firstNameController),
            TextFormFieldWidget(
                name: "Last Name", multiLines: true, controller: _lastNameController),
            FormSubmitBtn(
                isUpdatePatient: widget.isUpdatePatient,
                onPressed: validateFormThenUpdateOrAddpatient),
          ]),
    );
  }

  void validateFormThenUpdateOrAddpatient() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final patient = Patient(
          id: widget.isUpdatePatient ? widget.patient!.id : null,
          matricule: "",
          firstName: _firstNameController.text,
          lastName: _lastNameController.text, 
          room: '', 
          bed: '',

          );

      if (widget.isUpdatePatient) {
        BlocProvider.of<AddDeleteUpdatePatientBloc>(context)
            .add(UpdatePatientEvent(patient: patient));
      } else {
        BlocProvider.of<AddDeleteUpdatePatientBloc>(context)
            .add(AddPatientEvent(patient: patient));
      }
    }
  }
}
