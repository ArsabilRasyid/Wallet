import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilScreen());
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profil Pertamaku"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget Ikon (Bisa dianggap sebagai foto profil)
              CircleAvatar(
                radius: 60, // Ukuran lingkaran
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),

              const SizedBox(height: 10),

              // Widget Teks Nama
              const Text(
                "Arsabil Rasyid",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),

              // Widget Teks Deskripsi
              const Text(
                "Siswa SMK Multimedia - Belajar Flutter",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20), // Memberi jarak kosong
              // Widget Row untuk info tambahan
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 5),
                  Text("Jakarta, Indonesia"),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone_android, color: Colors.red),
                  SizedBox(width: 5),
                  Text("Email : Sabil2000@gmail.com"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
