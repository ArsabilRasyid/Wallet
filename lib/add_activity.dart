import 'package:flutter/material.dart';

class AddActivityScreen extends StatefulWidget {
  // Tambahkan variabel penerima di constructor
  final String kategoriPilihan;

  const AddActivityScreen({super.key, required this.kategoriPilihan});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final TextEditingController _controllerKegiatan = TextEditingController();
  final TextEditingController _controllerNominal = TextEditingController();

  @override
  void dispose() {
    _controllerKegiatan.dispose();
    _controllerNominal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Transaksi")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan kategori yang dipilih dari halaman GridView sebelumnya
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Kategori Dipilih: ${widget.kategoriPilihan}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerKegiatan,
              decoration: const InputDecoration(
                labelText: "Keterangan / Nama Kegiatan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controllerNominal,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nominal Uang (Rp)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_controllerKegiatan.text.isNotEmpty &&
                      _controllerNominal.text.isNotEmpty) {
                    // Kirim data Map lengkap beserta kategorinya balik ke Home
                    Map<String, dynamic> dataBaru = {
                      "kegiatan": _controllerKegiatan.text,
                      "nominal": int.parse(_controllerNominal.text),
                      "kategori":
                          widget.kategoriPilihan, // Data kategori ikut disimpan
                    };
                    Navigator.pop(context, dataBaru);
                  }
                },
                child: const Text("Simpan Transaksi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
