import 'package:flutter/material.dart';
import 'third_screen.dart'; // Pastikan path ini benar sesuai dengan struktur folder Anda

class SecondScreen extends StatelessWidget {
  final String name;

  const SecondScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0, // Menghilangkan shadow
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100), // Atur sesuai dengan jarak pada gambar
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24, // Ukuran font Welcome
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 24, // Ukuran font nama
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // Jarak antara teks welcome dan nama
            Text(
              'Selected User Name',
              style: TextStyle(
                fontSize: 18, // Ukuran font Selected User Name
                color: Colors.grey, // Warna font
              ),
            ),
            SizedBox(height: 24), // Jarak antara teks dan tombol
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                child: Text('Choose a User'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(double.infinity, 50), // Lebar dan tinggi tombol
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
