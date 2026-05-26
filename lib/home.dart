import 'package:flutter/material.dart';
import 'add_activity.dart';
import 'profile.dart';
import 'kategori_screen.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> daftarkegiatan = [
    {"nama": "Makan Siang", "icon": Icons.restaurant, "warna": Colors.orange},
    {
      "nama": "Transportasi",
      "icon": Icons.directions_car,
      "warna": Colors.blue,
    },
    {"nama": "Beli sembako", "icon": Icons.shopping_bag, "warna": Colors.green},
    {
      "nama": "Beli Pulsa",
      "icon": Icons.sports_esports,
      "warna": Colors.purple,
    },
    {"nama": "Sarapan", "icon": Icons.receipt_long, "warna": Colors.red},
    {"nama": "Pemasukan", "icon": Icons.savings, "warna": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Keuangan'),
        backgroundColor: Colors.indigo,
        leading: const Icon(Icons.account_balance_wallet, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Aksi saat ikon profil ditekan (misalnya, navigasi ke halaman profil)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarkegiatan.length, // Jumlah item dalam daftar kegiatan
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                child: const Icon(Icons.monetization_on, color: Colors.white),
              ),
              title: Text(daftarkegiatan[index]), // Menampilkan nama kegiatan
              subtitle: const Text('Hari ini'), // Deskripsi singkat
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Kegiatan Diklik'),
                      content: Text(
                        "Anda mengklik kegiatan: ${daftarkegiatan[index]}",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                ); // Aksi ketika item diklik (misalnya, navigasi ke detail kegiatan)
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 1. Alur diubah: Buka KategoriScreen terlebih dahulu
          final hasilDataTransaksi = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KategoriScreen()),
          );

          // 2. Jika proses input selesai dan membawa data transaksi baru, masukkan ke List
          if (hasilDataTransaksi != null) {
            setState(() {
              daftarkegiatan.add(hasilDataTransaksi);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
