import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar untuk responsivitas
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan Row dengan berbagai widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 50),
                SizedBox(width: 10),
                Text('Home Page', style: TextStyle(fontSize: 24)),
              ],
            ),
            SizedBox(height: 20),
            // Tombol untuk navigasi ke halaman berikutnya
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman kedua
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Go to Second Page'),
            ),
            SizedBox(height: 20),
            // Menampilkan ukuran layar (untuk memastikan responsif)
            Text('Screen Width: $screenWidth'),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Variabel untuk menampung input dari pengguna
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField untuk menerima input
            TextField(
              onChanged: (text) {
                setState(() {
                  inputText = text;
                });
              },
              decoration: InputDecoration(labelText: 'Enter something'),
            ),
            SizedBox(height: 20),
            // Menampilkan status input pengguna
            Text('You typed: $inputText'),
            SizedBox(height: 20),
            // Tombol untuk kembali ke halaman sebelumnya
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
