import 'package:flutter/material.dart';
import 'package:shortcad/widgets/my_app_bar.dart';
import 'package:shortcad/widgets/my_settings_list.dart';
import 'package:shortcad/widgets/my_side_menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: MySettingsList(),
      drawer: MySideMenu(),
    );
  }

  // _showList(BuildContext context) {
  //   Box box = db.getAjustes();
  //   return WatchBoxBuilder(
  //     box: box,
  //     builder: (BuildContext context, Box box) {
  //       return ListView.builder(
  //           itemCount: box.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             Ajuste item = box.getAt(index);
  //             return ListTile(
  //               title: Text(item.categoria),
  //             );
  //           });
  //     },
  //   );
  // }

  // _addAjuste() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           children: [
  //             TextField(
  //               decoration:
  //                   InputDecoration(icon: Icon(Icons.add_circle_outline)),
  //               onSubmitted: (text) {
  //                 var ajusteNuevo = Ajuste(text, 1);
  //                 db.insertar(ajusteNuevo);
  //                 Navigator.pop(context);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}
