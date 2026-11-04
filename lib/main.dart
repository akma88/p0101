import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniqueKey',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();

    tiles = [
      ColorWidget(key: UniqueKey(), text: '1'),
      ColorWidget(key: UniqueKey(), text: '2'),
    ];
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UniqueKey'), centerTitle: true),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz, size: 32),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final String text;
  final Color myColor = GenerateColor.getColor();

  ColorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      alignment: Alignment.center,
      color: myColor,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GenerateColor {
  static final random = Random();

  static Color getColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
