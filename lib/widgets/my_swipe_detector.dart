import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:shortcad/app/utils/app_colors.dart';
import 'package:shortcad/widgets/my_list.dart';

class MySwipeDetector extends StatefulWidget {
  const MySwipeDetector(
      {super.key,
      required this.lista,
      required this.titulo,
      required this.onUpFunction,
      required this.onRightFunction,
      required this.onDownFunction,
      required this.onLeftFunction});

  final List lista;
  final String titulo;
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
              widget.onUpFunction();
            },
            onSwipeRight: (Offset) {
              print("derecha");
              print(widget.titulo);
              widget.onRightFunction();
            },
            onSwipeDown: (Offset) {
              print("Abajo");
              widget.onDownFunction();
            },
            onSwipeLeft: (Offset) {
              print("Izquierda");
              widget.onLeftFunction();
            },
            child: widget.lista.isNotEmpty
                ? MyLista(lista: widget.lista, titulo: widget.titulo)
                : Center(
                    child: Text(
                    "Desliza hacia donde quieras ",
                    style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ))));
  }
}
