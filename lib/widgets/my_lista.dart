import 'package:flutter/material.dart';
import 'package:shortcad/widgets/Item.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key, required this.lista});

  final List lista;

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.lista.length,
        itemBuilder: (context, index) {
          return Item(item: widget.lista[index]);
        },
      ),
    );
  }
}
