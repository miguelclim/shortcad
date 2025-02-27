import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortcad/data/atajos.dart';
import 'package:shortcad/widgets/my_app_bar.dart';
import 'package:shortcad/widgets/my_multi_finger_detector.dart';
import 'package:shortcad/widgets/my_gesture_detector.dart';
import 'package:shortcad/widgets/my_side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.cat, this.id});

  final String cat;
  final int? id;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Atajo atajos = Atajo();

  List _items = [];
  String _titulo = "";

  Future<void> readJson(String atajos, int? id) async {
    final String response =
        await rootBundle.loadString('lib/data/repositories/atajos.json');
    final data = await json.decode(response);
    setState(() {
      //_items.isNotEmpty ? _items = [] : _items = data[atajos];
      //_titulo.isNotEmpty ? _titulo = "" : _titulo = atajos;
      _items = data[atajos] ?? []; // Aseguramos que sea una lista
      _titulo = atajos;

      if (id != null && id != 0) {
        _items.removeWhere((item) => item["id"].toString() != id.toString());
      }
      print("items: ${_items.length}");
      print(_titulo);
    });
  } 

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    if (widget.cat != "") {
      readJson(widget.cat, widget.id);
    }
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      // body: MyGestureDetector(
      //   lista: _items,
      //   titulo: _titulo,
      //   onTapFunction: () => readJson("Gestionar pantalla", null),
      //   onDobleTapFunction: () => readJson("Activa o desactiva los modos de dibujo", null),
      // ),
      body: MyMultiFingerDetector(
        lista: _items,
        titulo: _titulo,
      ),
      drawer: MySideMenu(),
    );
  }
}
