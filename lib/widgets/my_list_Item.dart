import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';

class MyListItem extends StatefulWidget {
  const MyListItem({super.key, required this.item});
  final item;

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(widget.item["id"]),
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.secondary,
      child: ListTile(
        title: Text(
          widget.item["comando"],
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
        ),
        subtitle: Text(
          widget.item["funcion"],
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16,
              fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
