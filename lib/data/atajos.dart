import 'dart:convert';
import 'package:flutter/services.dart';

class Atajo {
  List<Map<String, dynamic>> _items = [];

  Future<List<Map<String, dynamic>>> readJson(String categoria, int? id) async {
    final String response =
        await rootBundle.loadString('lib/data/repositories/atajos.json');
    
    final Map<String, dynamic> data = json.decode(response); // Sin `await`
    
    List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(data[categoria] ?? []);
    
    if (id != null) {
      items = items.where((item) => item["id"].toString() == id.toString()).toList();
    }

    _items = items;
    return _items;
  }

  List<Map<String, dynamic>> get items => _items;
}

