import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shortcad/widgets/my_list.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector(
      {super.key,
      required this.lista,
      required this.onTapFunction,
      required this.onDobleTapFunction});

  final List lista;
  final AsyncCallback onTapFunction;
  final AsyncCallback onDobleTapFunction;
  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTapFunction,
        onDoubleTap: widget.onDobleTapFunction,
        child: widget.lista.isNotEmpty
            ? MyLista(lista: widget.lista)
            : Center(
                child: Text("Realiza un gesto"),
              ),
      ),
    );
  }
}
