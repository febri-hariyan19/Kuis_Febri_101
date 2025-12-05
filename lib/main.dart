import 'package:flutter/material.dart';

void main() {
  runApp(const KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  const KalkulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const KalkulatorPage(),
    );
  }
}

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key}); // ✔ perbaikan: tambah key

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  double hasil = 0;

  void hitung(String operasi) {
    double a = double.tryParse(angka1Controller.text) ?? 0;
    double b = double.tryParse(angka2Controller.text) ?? 0;

    setState(() {
      if (operasi == "tambah") {
        hasil = a + b;
      } else if (operasi == "kurang") {
        hasil = a - b;
      } else if (operasi == "kali") {
        hasil = a * b;
      } else if (operasi == "bagi") {
        hasil = b == 0 ? 0 : a / b;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Sederhana"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Angka Pertama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Angka Kedua",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => hitung("tambah"),
                  child: const Text("Tambah"),
                ),
                ElevatedButton(
                  onPressed: () => hitung("kurang"),
                  child: const Text("Kurang"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => hitung("kali"),
                  child: const Text("Kali"),
                ),
                ElevatedButton(
                  onPressed: () => hitung("bagi"),
                  child: const Text("Bagi"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Text(
              "Hasil: $hasil",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
