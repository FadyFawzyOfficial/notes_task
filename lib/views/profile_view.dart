import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth/auth_cubit.dart';
import '../cubits/notes/notes_cubit.dart';
import 'widgets/main_elevated_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) => Text(
              'User Email: ${state.email}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          MainElevatedButton(
            label: 'Sign Out',
            onPressed: () {
              context
                  .read<NotesCubit>()
                  .clear()
                  .then((_) => context.read<AuthCubit>().signOut());
            },
          ),
        ],
      ),
    );
  }
}
