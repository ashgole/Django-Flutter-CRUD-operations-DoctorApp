import 'package:doctorapp/api/API.dart';
import 'package:doctorapp/common/CWidget.dart';
import 'package:flutter/material.dart';

final nameR = RegExp(r'^[a-zA-Z]+$');
final String nameU = 'use  a-z | A-Z';
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _signin = GlobalKey<FormState>();

  List<String> options = [
    'BP',
    'Pulse Rate',
    'Respiration Rate',
    'Body Temperature'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _signin,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              tf(
                username,
                'username',
                nameR,
                nameU,
              ),
              tf2(password, 'Password', nameR, nameU, TextInputType.number),
              button('Signin', login),
            ])),
      ),
    );
  }
}

login() {
  Map data = {
    'username': username.text,
    'password': password.text,
  };
  loginData('api/token/', data);
}
