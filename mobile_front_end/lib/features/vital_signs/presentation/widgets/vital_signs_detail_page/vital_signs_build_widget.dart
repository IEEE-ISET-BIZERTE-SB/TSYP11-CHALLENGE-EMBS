  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/widgets/loading_widget.dart';
import 'package:mobile_front_end/features/patients/presentation/widgets/patients_page/message_display_widget.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/bloc/vital_signs/vital_signs_bloc.dart';
import 'package:mobile_front_end/features/vital_signs/presentation/widgets/vital_signs_page/current_vital_signs_widget.dart';

  class VitalSignsBuildWidget extends StatelessWidget {

  const VitalSignsBuildWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<VitalSignsBloc, VitalSignsState>(
        builder: (context, state) {
          if (state is LoadingVitalSignsState) {
            return LoadingWidget();
          } else if (state is LoadedVitalSignsState) {
            return CurrentVitalSignsWidget(vitalSigns: state.vitalSigns);
          } else if (state is ErrorVitalSignsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}