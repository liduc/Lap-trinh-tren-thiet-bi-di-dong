import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bảng Cửu Chương',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiplicationTable(),
    );
  }
}

class MultiplicationTable extends StatefulWidget {
  @override
  _MultiplicationTableState createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _generateTable() {
    int number = int.tryParse(_controller.text) ?? 0;
    StringBuffer sb = StringBuffer();

    for (int i = 1; i <= 10; i++) {
      sb.writeln('$number x $i = ${number * i}');
    }

    setState(() {
      _result = sb.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảng Cửu Chương'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nhập số',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateTable,
              child: Text('Tạo Bảng Cửu Chương'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}