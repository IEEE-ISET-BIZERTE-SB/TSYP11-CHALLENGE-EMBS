import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/core/screens/home_page.dart';
import 'package:mobile_front_end/core/screens/starter_widget.dart';
import 'package:mobile_front_end/core/util/snack_bar_message.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile_front_end/features/auth/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StarterWidget(),
            ),
          );
        } else if (state is AuthErrorState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png', // Replace with the path to your logo image
                height: 100,
                width: 100,
              ),
              SizedBox(height: 16),
              // Login Form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
