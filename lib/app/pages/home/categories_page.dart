import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortcad/widgets/categories_list.dart';
import 'package:shortcad/widgets/my_side_menu.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List _items = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/data/repositories/atajos.json');
    final data = await json.decode(response);
    setState(() {
      print("items: ${_items.length}");
      _items.isNotEmpty ? _items = [] : _items = data["Categorias"];
    });
  }

  @override
  void initState() {
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shortcad'),
      ),
      body: CategoriesList(listaCategorias: (_items)),
      drawer: MySideMenu(),
    );
  }
}
