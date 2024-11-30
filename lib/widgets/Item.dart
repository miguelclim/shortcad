import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';

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
      color: AppColors.primary,
      child: ListTile(
        title: Text(
          widget.item["atajo"],
          style: TextStyle(color: AppColors.neutral),
        ),
        subtitle: Text(
          widget.item["desc"],
          style: TextStyle(color: AppColors.neutral_2),
        ),
      ),
    );
  }
}
