import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/bloc/patients/patients_bloc.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/Patient_add_update_page.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/patient_list_widget.dart';

class PatientsPage extends StatefulWidget {
  PatientsPage({Key? key}) : super(key: key);

  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar(BuildContext context) => AppBar(
        title: Text('patients'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientAddUpdatePage(isUpdatePatient: false),
                ),
              ).then((value) {
                _refreshIndicatorKey.currentState?.show();
              });
            },
          ),
        ],
      );

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => _onRefresh(context),
        child: BlocBuilder<PatientsBloc, PatientsState>(
          builder: (context, state) {
            if (state is LoadingPatientsState) {
              return LoadingWidget();
            } else if (state is LoadedPatientsState) {
              return PatientListWidget(patients: state.patients);
            } else if (state is ErrorPatientsState) {
              return MessageDisplayWidget(message: state.message);
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PatientsBloc>(context).add(RefreshPatientsEvent());
  }
}
