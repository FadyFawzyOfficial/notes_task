import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/strings.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/notes/notes_cubit.dart';
import 'firebase_options.dart';
import 'models/note.dart';
import 'simple_bloc_observer.dart';
import 'views/notes_view.dart';
import 'views/sign_in_view.dart';
import 'views/sign_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(kNotesBox);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit()..getNotes(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: kMainFontFamily,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
              ),
            ),
            routes: {
              kSignInView: (context) => const SignInView(),
              kSignUpView: (context) => const SignUpView(),
              kHomeView: (context) => const NotesView(),
            },
            home: state.authStatus == AuthStatus.authenticated
                ? const NotesView()
                : const SignInView(),
          );
        },
      ),
    );
  }
}
