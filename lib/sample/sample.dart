import 'dart:async' show Timer;

import 'package:experiments_with_web/app_level/services/local_storage_service.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key key}) : super(key: key);

  static final _storageService = locator<LocalStorageService>();

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
          children: [
            Text('$_counter'),
            OutlineButton(
              child: const Text('Save count in Storage'),
              onPressed: () {
                SamplePage._storageService.saveKeyValue('count', '1');
              },
            ),
            OutlineButton(
              child: const Text('Clear Storage'),
              onPressed: () => SamplePage._storageService.clear,
            ),
            OutlineButton(
              child: const Text('Remove count from Storage'),
              onPressed: () => SamplePage._storageService.removeKey('count'),
            ),
            OutlineButton(
              child: const Text('Fetch count from Storage'),
              onPressed: () async {
                final _value =
                    await SamplePage._storageService.fetchValue('count');
                print('Value is $_value');
              },
            ),
          ],
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
