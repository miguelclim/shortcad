import 'package:flutter/material.dart';
import 'package:shortcad/widgets/categorie_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.listaCategorias});
  
  final List listaCategorias;
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.listaCategorias.length,
        itemBuilder: (context,index){
          return CategorieItem(item:widget.listaCategorias[index]);
        },
        ),
    );
  }
}