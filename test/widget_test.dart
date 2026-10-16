import 'package:flutter_test/flutter_test.dart';
import 'package:nexasoft_incidencias/model/incidencia.dart';

void main() {
  test('Una incidencia antigua puede convertirse desde JSON', () {
    final registro = Incidencia.desdeJson({
      'id': 'INC-DEMO',
      'titulo': 'Prueba',
      'descripcion': 'Caso de ejemplo',
      'cliente': 'Cliente ficticio',
      'categoria': 'Redes',
      'estado': 'Pendiente',
      'fecha': '2026-10-12',
    });
    expect(registro.id, 'INC-DEMO');
    expect(registro.toJson()['estado'], 'Pendiente');
  });

  test('Una incidencia antigua sin prioridad usa Media', () {
    final registro = Incidencia.desdeJson({
      'id': 'INC-DEMO',
      'titulo': 'Prueba',
      'estado': 'Pendiente',
    });
    expect(registro.prioridad, 'Media');
    expect(registro.toJson()['prioridad'], 'Media');
  });

  test('Solo se aceptan prioridades Baja, Media o Alta', () {
    expect(Incidencia.desdeJson({'prioridad': 'Alta'}).prioridad, 'Alta');
    expect(Incidencia.desdeJson({'prioridad': 'Baja'}).prioridad, 'Baja');
    expect(Incidencia.desdeJson({'prioridad': 'Urgente'}).prioridad, 'Media');
  });
}
