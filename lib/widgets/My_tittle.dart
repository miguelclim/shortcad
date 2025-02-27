import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';

class MyTittle extends StatefulWidget {
  const MyTittle({super.key, required this.titulo});

  final String titulo;

  @override
  State<MyTittle> createState() => _MyTittleState();
}

class _MyTittleState extends State<MyTittle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.titulo,
      style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground, fontSize: 29, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
