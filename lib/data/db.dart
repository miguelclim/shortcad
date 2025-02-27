import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shortcad/data/ajuste.dart';

class AjustesDatabase {
  late Box ajustesBox;
  bool _isInitialized = false;

  Future<void> initDB() async {
    if (_isInitialized) return; // Evita inicialización múltiple

    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(AjusteAdapter());
    }

    if (!Hive.isBoxOpen('ajustes')) {
      ajustesBox = await Hive.openBox('ajustes');
    } else {
      ajustesBox = Hive.box('ajustes');
    }

    _isInitialized = true;
  }

  Future<void> insertar(Ajuste ajusteNuevo) async {
    await initDB(); // Asegura que la BD está inicializada antes de usarla
    ajustesBox.add(ajusteNuevo);
  }

  Future<Ajuste?> getAjuste(index) async {
    await initDB(); // Asegura que la base de datos está inicializada
    if (index >= 0 && index < ajustesBox.length) {
      return ajustesBox.getAt(index);
    } else {
      print("Índice fuera de rango");
      return null;
    }
  }

  Future<Box> getAjustes() async {
    await initDB();
    return ajustesBox;
  }

  Future<void> borrarPorIndice(int index) async {
    await initDB(); // Asegura que la base de datos está inicializada
    await ajustesBox.deleteAt(index);
    print("Elemento en el índice $index eliminado.");
  }

  Future<void> actualizarAjuste(int index, Ajuste ajusteActualizado) async {
    await initDB();
    ajustesBox.putAt(index, ajusteActualizado);
  }

  /// Método para verificar si la caja está vacía
  Future<bool> esCajaVacia() async {
    await initDB();
    return ajustesBox.isEmpty;
  }

  void dispose() {
    if (_isInitialized) {
      ajustesBox.close();
      _isInitialized = false;
    }
  }
}
