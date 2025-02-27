import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';
import 'package:shortcad/data/ajuste.dart';
import 'package:shortcad/data/atajos.dart';
import 'package:shortcad/data/db.dart';

class MySettingsItem extends StatefulWidget {
  const MySettingsItem(
      {super.key,
      required this.index,
      required this.gesto,
      required this.ajuste,
      required this.db});

  final int index;
  final String gesto;
  final Ajuste ajuste;
  final AjustesDatabase db;

  @override
  State<MySettingsItem> createState() => _MySettingsItemState();
}

class _MySettingsItemState extends State<MySettingsItem> {
  List<Map<String, dynamic>> _categorias = [];
  String? _selectedCategoria;

  List<Map<String, dynamic>> _atajos = [];
  int? _selectedAtajo;
  String? _comando;
  String? _funcion;

  Atajo atajo = Atajo();

  _cargarCategorias() async {
    List<Map<String, dynamic>> lista = await atajo.readJson('Categorias', null);
    _categorias = lista;
  }

  _cargarAtajos() async {
    List<Map<String, dynamic>> lista =
        await atajo.readJson(_selectedCategoria!, null);
    setState(() {
      _atajos = lista;
    });
  }

  _cargarComando() async {
    List<Map<String, dynamic>> lista =
        await atajo.readJson(_selectedCategoria!, _selectedAtajo);
    if (_selectedAtajo != 0) {
      _comando = lista[0]["comando"];
      _funcion = lista[0]["funcion"];
    } else {
      _comando = "Eliga un comando";
      _funcion = "";
    }
  }

  void initSettingItem() {
    _cargarCategorias();
    _selectedCategoria = widget.ajuste.categoria;
    _cargarAtajos();
    _selectedAtajo = widget.ajuste.id_atajo;
    _cargarComando();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSettingItem();

    print(_selectedCategoria);
    print(_selectedAtajo);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(widget.index),
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.gesto,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            subtitle: Text(
              "$_selectedCategoria -> $_comando -> $_funcion",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                TextButton(
                    onPressed: _actualizarAjuste,
                    child: Icon(Icons.edit,color: Theme.of(context).colorScheme.onSecondary)),
                TextButton(
                  onPressed: () {
                    widget.db.borrarPorIndice(widget.index);
                  },
                  child: Icon(Icons.delete,color: Theme.of(context).colorScheme.onSecondary,))
              ],
            ),
          )
        ],
      ),
    );
  }

  _actualizarAjuste() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return SimpleDialog(
              title: Text("Asignar gesto"),
              contentPadding: const EdgeInsets.all(20.0),
              children: [
                // DropdownMenu for Categories
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownMenu(
                    width: MediaQuery.of(context).size.width,
                    initialSelection: _selectedCategoria,
                    hintText: "Seleccione la Categoria",
                    dropdownMenuEntries: _categorias
                        .map((item) => DropdownMenuEntry(
                            value: item["nombre"], label: item["nombre"]))
                        .toList(),
                    onSelected: (value) {
                      setDialogState(() {
                        _selectedCategoria = value;
                        _selectedAtajo = null;
                      });
                      _cargarAtajos();
                    },
                  ),
                ),
                // DropdownMenu for Shortcuts
                // if (_atajos.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownMenu(
                    width: MediaQuery.of(context).size.height,
                    hintText: "Seleccione un atajo",
                    dropdownMenuEntries: _atajos
                        .map((item) => DropdownMenuEntry(
                            value: item["id"], label: item["comando"]))
                        .toList(),
                    onSelected: (value) {
                      setDialogState(() {
                        _selectedAtajo = int.parse(value);
                      });
                    },
                  ),
                ),
                // Save button
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.ajuste.categoria = _selectedCategoria!;
                      if (_selectedAtajo == null) {
                        widget.ajuste.id_atajo = 0;
                      } else {
                        widget.ajuste.id_atajo = _selectedAtajo!;
                      }
                      widget.db.actualizarAjuste(widget.index, widget.ajuste);
                      _cargarComando();
                      print(_selectedCategoria);
                      print(_selectedAtajo);
                    },
                    child: Text('Guardar',style: TextStyle(color:Theme.of(context).colorScheme.onSecondary ),))
              ],
            );
          },
        );
      },
    );
  }
}
