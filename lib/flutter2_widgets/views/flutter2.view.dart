import 'package:experiments_with_web/app_level/widgets/desktop/spacer_view.dart';

import 'package:flutter/material.dart';

import '../utilities/widgets.dart';

class Flutter2View extends StatelessWidget {
  const Flutter2View({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpacerView(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter 2 Widgets',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Text('Link Widget'),
              const SizedBox(height: 8),
              LinkerDemo(),
              const SizedBox(height: 12),
              CupertinoSearchDemo(),
              const SizedBox(height: 12),
              CupertinoFormDemo(),
              const SizedBox(height: 12),
              Text('Scaffold Messenger'),
              ScaffoldMessengerDemo(),
              const SizedBox(height: 22),
              Text('RawAutoComplete'),
              RawAutocompleteDemo(),
            ],
          ),
        ),
      ),
    );
  }
}
