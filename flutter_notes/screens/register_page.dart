import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/database_helper.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  void submit() {
    _dbHelper.register(_username.text, _password.text).then((onValue){
      print("Thành công");
    }).catchError((onError){
      print("Thất bại");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Đăng ký'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed:submit, child: const Text('Đăng ký')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const Login()))
                , child: Text('Đăng nhập'))
          ],
        ),
      ),
    );
  }
}