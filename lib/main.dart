import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EEF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5DADE2),
        elevation: 0,
        title: const Text(
          "Kartu Informasi Mahasiswa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: MahasiswaCard(
              nama: "Febro Alfarizi",
              nim: "230410123",
              prodi: "Teknik Informatika",
              angkatan: "2023",
              foto:
                  "depositphotos_129175154-stock-photo-african-man-with-no-expression.jpg",
              ttl: "Surabaya, 12 Juli 2003",
              alamat: "Jl. Merdeka 45, Surabaya",
              email: "febro@gmail.com",
              nohp: "0821-5566-7788",
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// CARD MAHASISWA MODERN + ANIMASI SCALE
// =====================================================
class MahasiswaCard extends StatefulWidget {
  final String nama, nim, prodi, angkatan, foto, ttl, alamat, email, nohp;

  const MahasiswaCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.angkatan,
    required this.foto,
    required this.ttl,
    required this.alamat,
    required this.email,
    required this.nohp,
  });

  @override
  State<MahasiswaCard> createState() => _MahasiswaCardState();
}

class _MahasiswaCardState extends State<MahasiswaCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 150),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        elevation: 8,
        shadowColor: Colors.black26,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          splashColor: Colors.blue.shade100,
          onTapDown: (_) => setState(() => _scale = 0.95),
          onTapCancel: () => setState(() => _scale = 1),
          onTap: () {
            setState(() => _scale = 1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailMahasiswaPage(
                  nama: widget.nama,
                  nim: widget.nim,
                  prodi: widget.prodi,
                  angkatan: widget.angkatan,
                  foto: widget.foto,
                  ttl: widget.ttl,
                  alamat: widget.alamat,
                  email: widget.email,
                  nohp: widget.nohp,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // FOTO DI TENGAH
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.foto),
                ),
                const SizedBox(height: 18),

                // BADGE ANGKATAN
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5DADE2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Angkatan ${widget.angkatan}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                // NAMA BESAR
                Text(
                  widget.nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),

                // PRODI
                Text(
                  widget.prodi,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade300, thickness: 1),

                const SizedBox(height: 12),

                // DATA IDENTITAS
                infoRow(Icons.credit_card, "NIM", widget.nim),
                const SizedBox(height: 8),
                infoRow(Icons.location_on, "Alamat", widget.alamat),
                const SizedBox(height: 8),
                infoRow(Icons.email, "Email", widget.email),
                const SizedBox(height: 8),
                infoRow(Icons.phone, "No HP", widget.nohp),

                const SizedBox(height: 20),

                // TOMBOL DETAIL FULL WIDTH
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF85C1E9),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailMahasiswaPage(
                            nama: widget.nama,
                            nim: widget.nim,
                            prodi: widget.prodi,
                            angkatan: widget.angkatan,
                            foto: widget.foto,
                            ttl: widget.ttl,
                            alamat: widget.alamat,
                            email: widget.email,
                            nohp: widget.nohp,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Lihat Detail",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Row informasi
  Widget infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue.shade400),
        const SizedBox(width: 10),
        SizedBox(width: 90, child: Text("$label:")),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// =====================================================
// HALAMAN DETAIL MAHASISWA (kini lebih modern)
// =====================================================
class DetailMahasiswaPage extends StatelessWidget {
  final String nama, nim, prodi, angkatan, foto, ttl, alamat, email, nohp;

  const DetailMahasiswaPage({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.angkatan,
    required this.foto,
    required this.ttl,
    required this.alamat,
    required this.email,
    required this.nohp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EEF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5DADE2),
        elevation: 0,
        title: Text(
          "Detail $nama",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 75, backgroundImage: NetworkImage(foto)),
            const SizedBox(height: 20),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    detailItem("Nama", nama),
                    detailItem("NIM", nim),
                    detailItem("Program Studi", prodi),
                    detailItem("Angkatan", angkatan),
                    detailItem("TTL", ttl),
                    detailItem("Alamat", alamat),
                    detailItem("Email", email),
                    detailItem("Nomor HP", nohp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text("$label:")),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
