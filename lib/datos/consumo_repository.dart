import '../dominio/consumo.dart';

/// Contrato de acceso a los consumos. No dice cómo ni dónde se guardan.
abstract class ConsumoRepository {
  Future<void> guardar(Consumo consumo);
  Future<List<Consumo>> todos();
}