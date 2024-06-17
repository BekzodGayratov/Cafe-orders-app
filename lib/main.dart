import 'package:flutter/material.dart';
import 'package:paloma365_task/layers/presentation/app_root.dart';

void main() async {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRoot();
  }
}
