import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/strings.dart';
import '../cubits/auth/auth_cubit.dart';
import '../utilities/snack_bar_shower.dart';
import 'widgets/main_elevated_button.dart';
import 'widgets/main_text_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes App')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign In', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 24),
              MainTextFormField(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value ?? '',
              ),
              const SizedBox(height: 16),
              MainTextFormField(
                label: 'Password',
                obscureText: true,
                onSaved: (value) => password = value ?? '',
              ),
              const SizedBox(height: 24),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.authStatus == AuthStatus.authenticated) {
                    showSnackBar(context, 'User has been authenticated');
                  } else if (state.authStatus == AuthStatus.failure) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return MainElevatedButton(
                    label: 'Sign In',
                    isLoading: state.authStatus == AuthStatus.loading,
                    onPressed: () {
                      if (isFormValid) {
                        context
                            .read<AuthCubit>()
                            .signIn(email: email, password: password);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, kSignUpView),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isFormValid {
    var form = _formKey.currentState;
    if (form == null || !form.validate()) return false;

    form.save();
    return true;
  }
}
