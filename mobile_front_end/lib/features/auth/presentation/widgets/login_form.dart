import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile_front_end/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile_front_end/features/auth/presentation/widgets/auth_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'username est obligatoire'; //dans le dossier Strings
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Entrer votre email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'le mot de passe est obligatoire'; //!! dans Strings
                }
                return null;
              },
              controller: _pwdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Entrer votre mot de passe',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
/* child: ElevatedButton(
onPressed: validateAndLoginUser,
child: const Text('Login'),
), */
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is LoginProgressState) {
                  return const CircularProgressIndicator(
                    color: Colors.blue,
                  );
                } else {
                  return AuthButton(
                      text: "Login",
                      onPressed: validateAndLoginUser,
                      color: Colors.blue);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void validateAndLoginUser() {
    if (_formKey.currentState!.validate()) {
      print("debut validation");
      final user = UserEntity(
          username: _usernameController.text.trim(),
          password: _pwdController.text.trim());
      print("debut validation2");
      BlocProvider.of<AuthBloc>(context).add(LoginEvent(user: user));
      print("debut validation3");
    }
  }
}
