import 'package:flutter/material.dart';
import 'package:moodsee/pages/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}
