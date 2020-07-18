import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final awal = TextEditingController(text: '');
  final akhir = TextEditingController(text: '');
  final multA = TextEditingController(text: '');
  final multB = TextEditingController(text: '');
  final hasil = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    handleCalculate() {
      int x = int.parse(awal.text);
      int n = int.parse(akhir.text);
      int a = int.parse(multA.text);
      int b = int.parse(multB.text);
      int sum = 0;

      for (int i = x; i < n; i++) {
        if (i % a == 0 || i % b == 0) {
          sum += i;
        }
      }

      print('sum: $sum');

      setState(() {
        hasil.text = sum.toString();
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Hitung Kelipatan'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                // nilai awal
                TextFormField(
                  controller: awal,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nilai awal tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nilai Awal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // nilai akhir
                TextFormField(
                  controller: akhir,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nilai akhir tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nilai Akhir',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Kelipatan A
                TextFormField(
                  controller: multA,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Kelipatan A tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Kelipatan A',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Kelipatan B
                TextFormField(
                  controller: multB,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Kelipatan B tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Kelipatan B',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Hasil
                TextFormField(
                  controller: hasil,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Hasil',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      handleCalculate();
                    }
                  },
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Hitung',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
}
