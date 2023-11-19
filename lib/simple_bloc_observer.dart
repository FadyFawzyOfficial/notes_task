import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Bloc Changed: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Bloc Closed: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Bloc Created: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
