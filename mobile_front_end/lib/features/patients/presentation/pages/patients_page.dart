import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/patients/patients_bloc.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patient_add_update_page.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/patient_list_widget.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppbar() => AppBar(title: const Text('patients'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PatientsBloc, PatientsState>(
        builder: (context, state) {
          if (state is LoadingPatientsState) {
            return const LoadingWidget();
          } else if (state is LoadedPatientsState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PatientListWidget(patients: state.patients));
          } else if (state is ErrorPatientsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PatientsBloc>(context).add(RefreshPatientsEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PatientAddUpdatePage(
                      isUpdatePatient: false,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }
}
