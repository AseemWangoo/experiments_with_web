import 'dart:async' show Timer;

import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _incCounter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Increment Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$_counter')],
        ),
      ),
    );
  }

  void get _incCounter {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setState(() => _counter = timer.tick),
    );
  }
}
