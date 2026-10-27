import 'package:flutter/foundation.dart';

import '../datos/consumo_repository.dart';
import '../dominio/consumo.dart';
import '../dominio/meta.dart';

/// Único dueño del estado compartido. No dibuja nada.
class ConsumosViewModel extends ChangeNotifier {
  ConsumosViewModel(ConsumoRepository repositorio) : _repositorio = repositorio;

  final ConsumoRepository _repositorio;

  // Estado compartido
  List<Consumo> consumos = [];
  String? error;
  bool guardando = false;
  double meta = metaInicial;

  // Estado derivado: getters, no campos
  double get total => consumos.fold(0.0, (suma, c) => suma + c.litros);
  double get avance => avanceDeMeta(total: total, meta: meta);
  bool get metaSuperada => total > meta;

  Future<void> cargar() async {
    consumos = await _repositorio.todos();
    notifyListeners();
  }

  /// Regresa true si se guardó.
  Future<bool> guardar(String laboratorio, String litrosTexto) async {
    // 1. Texto -> número (acepta coma decimal y espacios)
    final litros = double.tryParse(litrosTexto.trim().replaceAll(',', '.'));

    // 2. Validación del dominio
    final mensaje = validarLitros(litros);
    if (mensaje != null) {
      error = mensaje;
      notifyListeners();
      return false; // no se toca el repositorio
    }

    // 3. Marcar guardando y limpiar el error
    guardando = true;
    error = null;
    notifyListeners();

    // 4. Guardar y volver a leer la lista completa
    await _repositorio.guardar(
      Consumo(laboratorio: laboratorio, litros: litros!),
    );
    consumos = await _repositorio.todos();

    // 5. Desmarcar guardando
    guardando = false;
    notifyListeners();
    return true;
  }

  void subirMeta() {
    meta = ajustarMeta(meta, pasoMeta);
    notifyListeners();
  }

  void bajarMeta() {
    meta = ajustarMeta(meta, -pasoMeta);
    notifyListeners();
  }
}