class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({
    super.key,
    required this.alGuardar,   // Future<bool> Function(String laboratorio, String litros)
    required this.error,       // String?
    required this.guardando,   // bool
  });
}
class ListaHistorial extends StatelessWidget {
  const ListaHistorial({super.key, required this.consumos, required this.total});
}
class PanelMeta extends StatelessWidget {
  const PanelMeta({
    super.key,
    required this.usado,      // double
    required this.meta,       // double
    required this.avance,     // double
    required this.superada,   // bool
    required this.alSubir,    // VoidCallback
    required this.alBajar,    // VoidCallback
  });
}
class PantallasEcoTrack extends StatefulWidget {
  const PantallasEcoTrack({
    super.key,
    required this.titulo,
    required this.registro,
    required this.historial,
    required this.meta,
  });
}