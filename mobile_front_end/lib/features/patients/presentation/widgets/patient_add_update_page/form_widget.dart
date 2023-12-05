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
  final TextEditingController _matriculeController = TextEditingController(); // Added
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _bedController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePatient) {
      _matriculeController.text = widget.patient!.matricule; // Added
      _firstNameController.text = widget.patient!.firstName;
      _lastNameController.text = widget.patient!.lastName;
      _roomController.text = widget.patient!.room;
      _bedController.text = widget.patient!.bed;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return  SingleChildScrollView(
      child:
      Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            name: "Matricule",
            multiLines: false,
            controller: _matriculeController,
          ),
          TextFormFieldWidget(
            name: "First Name",
            multiLines: false,
            controller: _firstNameController,
          ),
          TextFormFieldWidget(
            name: "Last Name",
            multiLines: false,
            controller: _lastNameController,
          ),
          TextFormFieldWidget(
            name: "Room",
            multiLines: false,
            controller: _roomController,
          ),
          TextFormFieldWidget(
            name: "Bed",
            multiLines: false,
            controller: _bedController,
          ),
          FormSubmitBtn(
            isUpdatePatient: widget.isUpdatePatient,
            onPressed: validateFormThenUpdateOrAddpatient,
          ),
        ],
      ),
    ));
  }

  void validateFormThenUpdateOrAddpatient() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final patient = Patient(
        id: widget.isUpdatePatient ? widget.patient!.id : null,
        matricule: _matriculeController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        room: _roomController.text,
        bed: _bedController.text,
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
