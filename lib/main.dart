import 'package:doctorapp/pages/registration/Signin.dart';
import 'package:flutter/material.dart';
import 'common/ThemePage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
