import 'dart:developer';

import 'package:flutter/material.dart';

class ValueKeyExample1 extends StatefulWidget {
  const ValueKeyExample1({super.key});

  @override
  State<ValueKeyExample1> createState() => _ValueKeyExample1State();
}

class _ValueKeyExample1State extends State<ValueKeyExample1> {
  late int counter;

  @override
  void initState() {
    log('# ValueKeyExample1 init State');
    counter = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    log('ValueKeyExample1-call method build(context)');
    return Scaffold(
      appBar: AppBar(title: Text("Value Key Example 1"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleAnimated(
              key: null,
              duration: Duration(seconds: 2),
              child: Text(
                "Виджет без ключа:  $counter ",
                style: TextStyle(fontSize: 30),
              ),
            ),
            ScaleAnimated(
              key: ValueKey(counter),
              duration: Duration(seconds: 2),
              child: Text(
                "Виджет с ключом: $counter ",
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              child: Text("Нажми меня", style: TextStyle(fontSize: 20)),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleAnimated extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleAnimated({super.key, required this.child, required this.duration});

  @override
  State<ScaleAnimated> createState() => _ScaleAnimatedState();
}

class _ScaleAnimatedState extends State<ScaleAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    log('#Scale Animated init State');
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: 1.0,
      lowerBound: 0.0,
    );
    _controller.forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
