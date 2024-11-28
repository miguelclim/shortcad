import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.item});
  final item;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(widget.item["id"]),
      margin: const EdgeInsets.all(10),
      color: Colors.red,
      child: ListTile(
        leading: Text(widget.item["id"]),
        title: Text(widget.item["atajo"]),
        subtitle: Text(widget.item["desc"]),
      ),
    );
  }
}
