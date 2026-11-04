import 'package:flutter/material.dart';
import 'package:p0101/value_key_example_1.dart';
import 'package:p0101/value_key_example_2.dart';
import 'package:p0101/value_key_example_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData.dark(),
      home: ValueKeyExample2(),
    );
  }
}
