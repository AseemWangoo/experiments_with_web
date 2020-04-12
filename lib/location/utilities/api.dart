// ignore_for_file: argument_type_not_assignable

import 'dart:convert';

import 'package:experiments_with_web/location/model/location.dart';
import 'package:http/http.dart' as http;

const _url = 'https://geolocation-db.com/json/';

class LocationAPI {
  LocationAPI();

  void fetchData() async {
    final resp = await http.get(_url);

    if (resp.statusCode == 200) {
      final _data = LocationModel.fromJson(json.decode(resp.body));
      print(_data.city);
    }
  }
}
