import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shortcad/app/pages/home_page.dart';
import 'package:shortcad/app/pages/list_page.dart';
import 'package:shortcad/data/ajuste.dart';
import 'package:shortcad/data/db.dart';
import 'package:shortcad/widgets/my_list.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class MyMultiFingerDetector extends StatefulWidget {
  const MyMultiFingerDetector(
      {super.key, required this.lista, required this.titulo});

  final List lista;
  final String titulo;

  @override
  State<MyMultiFingerDetector> createState() => _MyMultiFingerDetectorState();
}

class _MyMultiFingerDetectorState extends State<MyMultiFingerDetector> {
  Offset _startPosition = Offset.zero;
  Offset _endPosition = Offset.zero;
  int _contadorDedos = 0;
  int _dedosContados = 0;

  String _categoria = "";
  int _id = 0;

  late Future<Box> ajustesBoxFuture;
  AjustesDatabase db = AjustesDatabase();

  void verificarAjustes() async {
    await db.initDB();
    bool vacio = await db.esCajaVacia();
    if (!vacio) {
      print("caja no vacia");
    } else {
      print("caja vacia");
      for (var i = 0; i < 6; i++) {
        await db.insertar(
            Ajuste("Activación/desactivación y administración de pantalla", 0));
      }
    }
  }

  Future<void> _obtenerAjuste(String direccion, int num_dedos) async {
    await db.initDB();
    Ajuste? ajusteObtenido = await db.getAjuste(0);
    switch (direccion) {
      case "arriba":
        switch (num_dedos) {
          case 1:
            ajusteObtenido = await db.getAjuste(0);
            break;
          case 2:
            ajusteObtenido = await db.getAjuste(2);
            break;
          case 3:
            ajusteObtenido = await db.getAjuste(4);
            break;
        }
        break;
      case "abajo":
        switch (num_dedos) {
          case 1:
            ajusteObtenido = await db.getAjuste(1);
            break;
          case 2:
            ajusteObtenido = await db.getAjuste(3);
            break;
          case 3:
            ajusteObtenido = await db.getAjuste(5);
            break;
        }
        break;
    }

    if (ajusteObtenido == null) {
      print("No se encontró el ajuste");
    } else {
      setState(() {
        _categoria = ajusteObtenido?.categoria ?? "";
        _id = ajusteObtenido?.id_atajo ?? 0;
      });
      print("Categoria: ${_categoria}, id: ${_id}");
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListPage(
                  cat: _categoria,
                  id: _id,
                )));
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _contadorDedos++;
      _dedosContados = _contadorDedos;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _contadorDedos = (_contadorDedos - 1).clamp(0, 4);
    });

    if (_contadorDedos == 0) {
      _detectarGesto();
    }
  }

  void _onPanStart(DragStartDetails details) {
    _startPosition = details.globalPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _endPosition = details.globalPosition;
  }

  void _detectarGesto() {
    if (_contadorDedos > 0) return;

    Offset delta = _endPosition - _startPosition;

    if (delta.distance < 50) return;

    String direccion = '';

    direccion = delta.dy > 0 ? 'abajo' : 'arriba';

    print('Swipe con $_dedosContados dedos hacia $direccion');

    _obtenerAjuste(direccion, _dedosContados);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarAjustes();
    ajustesBoxFuture = db.getAjustes();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        behavior: HitTestBehavior.translucent,
        child: widget.lista.isNotEmpty
            ? MyLista(lista: widget.lista, titulo: widget.titulo)
            : Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
      ),
    );
  }

  /*Offset _startPosition = Offset.zero;
  Offset _endPosition = Offset.zero;
  int _fingerCount = 0;
  int _fingers = 0;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _fingerCount++; // Contamos cuántos dedos están tocando la pantalla
      _fingers = _fingerCount;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _fingerCount = (_fingerCount - 1).clamp(0, 4); // Evita valores negativos
    });

    if (_fingerCount == 0) {
      _detectSwipeGesture(); // Llamamos a la detección cuando se levantan todos los dedos
    }
  }

  void _onPanStart(DragStartDetails details) {
    _startPosition = details.globalPosition; // Guardamos la posición inicial del swipe
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _endPosition = details.globalPosition; // Actualizamos la posición final
  }

  void _detectSwipeGesture() {
    if (_fingerCount > 0) return; // Evita detectar mientras haya dedos en pantalla

    Offset difference = _endPosition - _startPosition;
    if (difference.distance < 50) return; // Filtra movimientos pequeños

    String direction = '';
    if (difference.dx.abs() > difference.dy.abs()) {
      direction = difference.dx > 0 ? 'derecha' : 'izquierda';
    } else {
      direction = difference.dy > 0 ? 'abajo' : 'arriba';
    }

    debugPrint('Swipe con $_fingers dedos hacia $direction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          behavior: HitTestBehavior.translucent,
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue.shade200,
              child: const Center(
                child: Text(
                  'Desliza con 2, 3 o 4 dedos y suéltalos para ver el gesto',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }*/
}
