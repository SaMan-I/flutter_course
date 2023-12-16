import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_infinite_list_bloc/app/app.dart';
import 'package:flutter_infinite_list_bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
