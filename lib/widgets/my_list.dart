import 'package:flutter/material.dart';
import 'package:shortcad/widgets/my_list_Item.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key, required this.lista});

  final List lista;

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {
  @override
  Widget build(BuildContext context) {
    /*return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.lista.length,
            itemBuilder: (context, index) {
              return Item(item: widget.lista[index]);
            },
          ),
        )
      ],
    );*/
    return ListView.builder(
      itemCount: widget.lista.length,
      itemBuilder: (context, index) {
        return MyListItem(item: widget.lista[index]);
      },
    );
  }
}
