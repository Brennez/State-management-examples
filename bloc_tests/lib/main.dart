import 'package:bloc/bloc.dart';
import 'package:bloc_tests/bloc_example/pages/clients_page.dart';
import 'package:bloc_tests/counter_example/counter_observer.dart';
import 'package:flutter/material.dart';

import 'counter_example/view/counter_page.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      home: ClientsPage(),
    );
  }
}
