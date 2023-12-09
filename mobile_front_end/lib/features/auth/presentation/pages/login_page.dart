import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/util/snack_bar_message.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile_front_end/features/auth/presentation/widgets/login_form.dart';

//import 'package:go_router/go_router.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
//naviguer vers liste de post
        } else if (state is AuthErrorState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Colors.black), // Icône de retour en noir
        ),
        backgroundColor: Colors.white,
        body: LoginForm(),
      ),
    );
  }
}
