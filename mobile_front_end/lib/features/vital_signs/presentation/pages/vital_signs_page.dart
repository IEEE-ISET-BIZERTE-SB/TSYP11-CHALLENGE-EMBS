import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/bloc/vital_signs/vital_signs_bloc.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/widgets/vital_signs_page/vital_signs_list_widget.dart';

class VitalSignsPage extends StatelessWidget {
  VitalSignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar(BuildContext context) => AppBar(
        title: Text('vital signs'),
      );

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<VitalSignsBloc, VitalSignsState>(
        builder: (context, state) {
          if (state is LoadingVitalSignsState) {
            return LoadingWidget();
          } else if (state is LoadedVitalSignsState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: VitalSignsStreamWidget(vitalSigns: state.vitalSigns),
            );
          } else if (state is ErrorVitalSignsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<VitalSignsBloc>(context).add(RefreshVitalSignsEvent(patientId: "eFLS4MWGjLZFaNuhPnig"));
  }
}
