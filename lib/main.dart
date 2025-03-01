import 'package:flutter/material.dart';
import 'package:shortcad/app/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shortcad/app/utils/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = getApplicationDocumentsDirectory();
  Hive.init(path.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: HomePage(cat: "",));
  }
}
