import '../dominio/consumo.dart';
import 'consumo_repository.dart';

class MemoriaConsumoRepository implements ConsumoRepository {
  final List<Consumo> _consumos = [];

  @override
  Future<void> guardar(Consumo consumo) async {
    _consumos.add(consumo);
  }

  @override
  Future<List<Consumo>> todos() async {
    // Copia no modificable: nadie puede alterar la lista interna desde fuera.
    return List.unmodifiable(_consumos);
  }
}