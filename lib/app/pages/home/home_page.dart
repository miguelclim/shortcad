import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortcad/widgets/my_app_bar.dart';
import 'package:shortcad/widgets/my_gesture_detector.dart';
import 'package:shortcad/widgets/my_side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String this.cat});

  final String cat;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];
  Future<void> readJson(String atajos) async {
    final String response =
        await rootBundle.loadString('lib/data/repositories/atajos.json');
    final data = await json.decode(response);
    setState(() {
      print("items: ${_items.length}");
      _items.isNotEmpty ? _items = [] : _items = data[atajos];
    });
  }

  @override
  void initState() {
    if (widget.cat != "") {
      readJson(widget.cat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MyGestureDetector(
        lista: _items,
        onTapFunction: () => readJson("Gestionar Pantalla"),
        onDobleTapFunction: () => readJson("Gestionar Dibujos"),
      ),
      drawer: MySideMenu(),
    );
  }
}
