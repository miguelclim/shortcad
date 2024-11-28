import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shortcad/widgets/my_lista.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({super.key, required this.lista,required this.readJson});

  final List lista;
  final AsyncCallback readJson;
  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onDoubleTap: widget.readJson,
        child: widget.lista.isNotEmpty? MyLista(lista:widget.lista): Center(child: Text("no hay"),),
      ),
    );
  }
}