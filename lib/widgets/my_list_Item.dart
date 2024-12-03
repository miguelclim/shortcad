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
      color: AppColors.primary,
      child: ListTile(
        title: Text(
          widget.item["comando"],
          style: TextStyle(
              color: AppColors.neutral,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.item["funcion"],
          style: TextStyle(
              color: AppColors.neutral_2,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
