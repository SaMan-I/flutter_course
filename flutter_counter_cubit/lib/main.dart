import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_cubit/counter_observer.dart';

import 'app/app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}
