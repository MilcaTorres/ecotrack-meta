class ConsumosViewModel extends ChangeNotifier {
  ConsumosViewModel(ConsumoRepository repositorio);

  List<Consumo> consumos;    // empieza vacía
  String? error;             // empieza en null
  bool guardando;            // empieza en false
  double meta;               // empieza en metaInicial

  double get total;          // derivados: getters, NO campos
  double get avance;
  bool get metaSuperada;

  Future<void> cargar() { ... }
  Future<bool> guardar(String laboratorio, String litrosTexto) { ... }  // true si se guardó
  void subirMeta() { ... }
  void bajarMeta() { ... }
}