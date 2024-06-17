import 'package:flutter/material.dart';

class StandartPadding extends StatelessWidget {
  final Widget child;
  const StandartPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding:const EdgeInsets.symmetric(horizontal: 16.0),child:child);
  }
}
