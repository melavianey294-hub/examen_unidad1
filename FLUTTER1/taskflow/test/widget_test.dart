import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('La app carga correctamente', (WidgetTester tester) async {
    // Cargar la app
    await tester.pumpWidget(const TaskApp());

    // Verificar que aparece el título
    expect(find.text('TaskFlow'), findsOneWidget);

    // Verificar que existe el campo de texto
    expect(find.byType(TextField), findsOneWidget);

    // Verificar que existe el botón +
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
