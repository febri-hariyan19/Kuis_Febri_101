import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // sesuaikan dengan nama project

void main() {
  testWidgets('Kalkulator Tambah Test', (WidgetTester tester) async {
    // Build widget kalkulator
    await tester.pumpWidget(const KalkulatorApp());

    // Cari input dan tombol
    final angka1Field = find.byType(TextField).at(0);
    final angka2Field = find.byType(TextField).at(1);
    final tambahButton = find.text('Tambah');

    // Masukkan angka
    await tester.enterText(angka1Field, '5');
    await tester.enterText(angka2Field, '7');

    // Tekan tombol tambah
    await tester.tap(tambahButton);
    await tester.pump();

    // Cek hasil
    expect(find.text('Hasil: 12.0'), findsOneWidget);
  });
}
