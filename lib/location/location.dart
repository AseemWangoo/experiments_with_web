import 'dart:html';

import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/location/utilities/helpers.dart';

import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              final _res =
                  stringify('{ name: "John", age: 30, city: "New York" }');
              // window.console.log(_res);
              print(_res);
            },
            child: Text('Call JS Stringify'),
          ),
        ],
      ),
    );
  }
}

// CANNOT WORK ON WEB SERVER
