import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:shortcad/app/pages/home/home_page.dart';
import 'package:shortcad/widgets/my_list.dart';

class MySwipeDetector extends StatefulWidget {
  const MySwipeDetector(
      {super.key,
      required this.lista,
      required this.onUpFunction,
      required this.onRightFunction,
      required this.onDownFunction,
      required this.onLeftFunction});

  final List lista;
  final VoidCallback onUpFunction;
  final VoidCallback onRightFunction;
  final VoidCallback onDownFunction;
  final VoidCallback onLeftFunction;

  @override
  State<MySwipeDetector> createState() => _MySwipeDetectorState();
}

class _MySwipeDetectorState extends State<MySwipeDetector> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SwipeDetector(
            onSwipeUp: (Offset) {
              print("arriba");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Activación/desactivación y administración de pantalla")));
              widget.onUpFunction();
            },
            onSwipeRight: (Offset) {
              print("derecha");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gestionar pantalla")));
              widget.onRightFunction();
            },
            onSwipeDown: (Offset) {
              print("Abajo");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gestionar dibujos")));
              widget.onDownFunction();
            },
            onSwipeLeft: (Offset) {
              print("Izquierda");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Activa o desactiva los modos de dibujo")));
              widget.onLeftFunction();
            },
            child: widget.lista.isNotEmpty
                ? MyLista(lista: widget.lista)
                : Center(child: Text("Realiza un gesto"))));
  }
}
