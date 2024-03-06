import 'package:flutter/material.dart';
//kak izin sekalian buat tugas kelas teori :)

void main() {
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String storedUsername = 'silvester'; // Akun yang disimpan
  String storedPassword = '123210093'; // Kata sandi yang disimpan

  List<String> savedUsernames = ['silvester']; // Daftar akun yang disimpan
  List<String> savedPasswords = ['123210093']; // Daftar kata sandi yang disimpan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue, // Mengatur warna header biru
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset( // Menambahkan logo di atas formfield username
              'android/gambar/logo.png', // Ganti 'assets/logo.png' dengan path logo Anda
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder( // Membuat sudut bulat pada TextField
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder( // Membuat sudut bulat pada TextField
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                if ((savedUsernames.contains(username)) &&
                    (savedPasswords[savedUsernames.indexOf(username)] ==
                        password)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Username/password salah'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
            TextButton( // Tombol untuk menampilkan dialog tambah akun
              onPressed: () {
                _showAddAccountDialog(context);
              },
              child: Text('Tambah Akun'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddAccountDialog(BuildContext context) {
    String newUsername = '';
    String newPassword = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Akun'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newUsername = value;
                },
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                onChanged: (value) {
                  newPassword = value;
                },
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (newUsername.isNotEmpty && newPassword.isNotEmpty) {
                  setState(() {
                    savedUsernames.add(newUsername);
                    savedPasswords.add(newPassword);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Tambah'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathOperationScreen()),
                );
              },
              child: Text('Penjumlahan/Pengurangan'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OddEvenScreen()),
                );
              },
              child: Text('Input Bilangan (Ganjil/Genap)'),
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KreatorScreen()),
                );
              },
              child: Text('Pembuat'),
            ),
          ],
        ),
      ),
    );
  }
}
class KreatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Pembuat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pembuat:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Silvester Renanda H',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'NIM: 123210093',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
class MathOperationScreen extends StatefulWidget {
  @override
  _MathOperationScreenState createState() => _MathOperationScreenState();
}

class _MathOperationScreenState extends State<MathOperationScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjumlahan/Pengurangan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: 'Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: 'Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    try {
                      double num1 = double.parse(num1Controller.text);
                      double num2 = double.parse(num2Controller.text);
                      resultController.text = (num1 + num2).toString();
                    } catch (e) {
                      resultController.text = 'Input tidak valid';
                    }
                  },
                  child: Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: () {
                    try {
                      double num1 = double.parse(num1Controller.text);
                      double num2 = double.parse(num2Controller.text);
                      resultController.text = (num1 - num2).toString();
                    } catch (e) {
                      resultController.text = 'Input tidak valid';
                    }
                  },
                  child: Text('Kurang'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: resultController,
              decoration: InputDecoration(labelText: 'Hasil'),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}

class OddEvenScreen extends StatefulWidget {
  @override
  _OddEvenScreenState createState() => _OddEvenScreenState();
}

class _OddEvenScreenState extends State<OddEvenScreen> {
  TextEditingController numController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Bilangan (Ganjil/Genap)'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: numController,
              decoration: InputDecoration(labelText: 'Masukkan Angka'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  int num = int.parse(numController.text);
                  setState(() {
                    result = num % 2 == 0 ? 'Genap' : 'Ganjil';
                  });
                } catch (e) {
                  setState(() {
                    result = 'Input tidak valid';
                  });
                }
              },
              child: Text('Deteksi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
