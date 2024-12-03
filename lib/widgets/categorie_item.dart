import 'package:flutter/material.dart';
import 'package:shortcad/app/pages/home/home_page.dart';
import 'package:shortcad/app/utils/app_colors.dart';

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
      color: AppColors.primary,
      child: ListTile(
        title: Text(
          widget.item["nombre"],
          style: TextStyle(color: AppColors.neutral, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(cat: widget.item["nombre"],
                      )));
        },
      ),
    );
  }
}
