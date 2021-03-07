import 'package:experiments_with_web/app_level/services/local_storage_service.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_drawer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/sample/utilities/constants.dart';

import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key key}) : super(key: key);

  static final _storageService = locator<LocalStorageService>();

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final int _counter = 0;

  @override
  void initState() {
    super.initState();
    _incCounter;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showDrawer: true,
      drawerChild: CustomDrawer(
        medium: SampleConstants.medium,
        youtubeLink: SampleConstants.youtube,
        website: SampleConstants.website,
      ),
      titleText: 'Auto Increment Counter',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'),
            OutlinedButton(
              child: const Text('Save count in Storage'),
              onPressed: () {
                SamplePage._storageService.saveKeyValue('count', '1');
              },
            ),
            OutlinedButton(
              child: const Text('Clear Storage'),
              onPressed: () => SamplePage._storageService.clear,
            ),
            OutlinedButton(
              child: const Text('Remove count from Storage'),
              onPressed: () => SamplePage._storageService.removeKey('count'),
            ),
            OutlinedButton(
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
    // Timer.periodic(
    //   const Duration(seconds: 1),
    //   (timer) => setState(() => _counter = timer.tick),
    // );
  }
}
