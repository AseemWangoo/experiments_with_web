import 'dart:html';
import 'dart:js' as js;

import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/location/utilities/alert.dart';
import 'package:experiments_with_web/location/utilities/api.dart';
import 'package:experiments_with_web/location/utilities/loc.dart';
import 'package:experiments_with_web/location/utilities/stringify.dart';

import 'package:flutter/material.dart';
import 'package:js/js.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key key}) : super(key: key);

  static const _obj = '{ name: "AseemWangoo", location: "Earth" }';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double _latitude = 0.0;
  double _longitude = 0.0;

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                final _res = stringify(LocationScreen._obj);
                window.console.log(_res);
              },
              child: const Text('Call JS Stringify'),
            ),
            OutlineButton(
              onPressed: () {
                js.context['console'].callMethod(
                  'log',
                  <String>['I am', '\n', 'CONSOLEDDD'],
                );
              },
              child: const Text('Print in Console'),
            ),
            OutlineButton(
              onPressed: () => alert('Hello!! from JS'),
              child: const Text('Alert in Flutter Web'),
            ),
            OutlineButton(
              onPressed: () => detectUserLocation(),
              child: const Text('Location in Flutter Web'),
            ),
            OutlineButton(
              onPressed: () {
                getCurrentPosition(allowInterop((pos) {
                  // print('LAT >>> ${pos.coords.latitude}');
                  // print('LONG >>> ${pos.coords.longitude}');
                  setState(() {
                    _latitude = pos.coords.latitude;
                    _longitude = pos.coords.longitude;
                  });
                }));
              },
              child: const Text('Mozilla GeoLocation'),
            ),
            Text('LAT : $_latitude'),
            Text('LONG : $_longitude'),
            OutlineButton(
              onPressed: () async {
                LocationAPI().fetchData();
              },
              child: const Text('Location from API'),
            ),
          ],
        ),
      ),
    );
  }
}
