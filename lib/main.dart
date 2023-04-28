import 'package:flutter/material.dart';
import 'MainWindow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldScreen(),
    );
  }
}
