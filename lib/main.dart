import 'package:flutter/material.dart';
import 'second_screen.dart'; // Pastikan ini sesuai dengan lokasi file SecondScreen Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palindrome Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

bool isPalindrome(String text) {
  String cleanText = text.replaceAll(' ', '').toLowerCase();
  String reversedText = cleanText.split('').reversed.join('');
  return cleanText == reversedText;
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final sentenceController = TextEditingController();

  void showPalindromeDialog(bool isPalindrome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Colors.transparent, // Jika AppBar harus transparan
        elevation: 0, // Menghilangkan shadow
      ),
      body: Center( // Center widget digunakan untuk sentralisasi widget anak
        child: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk mencegah overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60, // Atur radius sesuai kebutuhan
                backgroundColor: Colors.blue, // Atur warna background
                child: Icon(Icons.person, size: 60), // Atur icon dan ukuran
              ),
              SizedBox(height: 48), // Jarak antara avatar dan form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true, // Untuk style filled
                    fillColor: Colors.white, // Warna background field
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Rounded corner
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: sentenceController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Palindrome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak antara field dan button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  child: Text('CHECK'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(double.infinity, 50), // width dan height button
                  ),
                  onPressed: () {
                    final isPalin = isPalindrome(sentenceController.text);
                    showPalindromeDialog(isPalin);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  child: Text('NEXT'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(name: nameController.text),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
