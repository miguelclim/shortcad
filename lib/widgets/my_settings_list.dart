import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shortcad/data/ajuste.dart';
import 'package:shortcad/data/db.dart';
import 'package:shortcad/widgets/my_settings_item.dart';

class MySettingsList extends StatefulWidget {
  const MySettingsList({super.key});

  @override
  State<MySettingsList> createState() => _MySettingsListState();
}

class _MySettingsListState extends State<MySettingsList> {
  List<String> listaGestos = [
    'Deslizar hacia arriba con 1 dedo',
    'Deslizar hacia abajo con 1 dedo',
    'Deslizar hacia arriba con 2 dedos',
    'Deslizar hacia abajo con 2 dedos',
    'Deslizar hacia arriba con 3 dedos', 
    'Deslizar hacia abajo con 3 dedos'
  ];
  late Future<Box> ajustesBoxFuture;
  AjustesDatabase db = AjustesDatabase();

  void verificarAjustes() async{
    await db.initDB();
    bool vacio = await db.esCajaVacia();
    if (!vacio) {
      print("caja no vacia");
    }
    else{
      print("caja vacia");
      for (var gesto in listaGestos) {
        await db.insertar(Ajuste("Activación/desactivación y administración de pantalla", 0));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    verificarAjustes();
    ajustesBoxFuture = db.getAjustes(); // Obtener la base de datos al inicio
  }

  @override
  void dispose() {
    db.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box>(
      future: ajustesBoxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error al cargar ajustes"));
        } else if (!snapshot.hasData) {
          return Center(child: Text("No hay datos disponibles"));
        }

        Box ajustesBox = snapshot.data!;
        return ValueListenableBuilder(
          valueListenable: ajustesBox.listenable(),
          builder: (context, Box box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Ajuste? ajuste = box.getAt(index);
                String gesto = listaGestos.isNotEmpty 
                    ? listaGestos[index % listaGestos.length] 
                    : "Gesto desconocido";

                return MySettingsItem(
                  index: index,
                  gesto: gesto,
                  ajuste: ajuste ?? Ajuste("",0),
                  db:db
                );
              },
            );
          },
        );
      },
    );
  }
}
