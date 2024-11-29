import 'package:flutter/material.dart';

class CategorieItem extends StatefulWidget {
  const CategorieItem({super.key, required this.item});
  final item;

  @override
  State<CategorieItem> createState() => _CategorieItemState();
}

class _CategorieItemState extends State<CategorieItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(widget.item["id"]),
      margin: const EdgeInsets.all(10),
      color: Colors.red,
      child: ListTile(
        title: Text(widget.item["nombre"]),
      ),
    );
  }
}
