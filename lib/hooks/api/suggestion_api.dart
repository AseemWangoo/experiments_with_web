import 'dart:async';
import 'dart:io';

import 'package:experiments_with_web/hooks/models/suggestion.dart';
import 'package:experiments_with_web/hooks/models/suggestion_resp.dart';
import 'package:http/http.dart' as http;

const _url = 'https://tinyurl.com/y9ha4h34';

class SuggestionApi {
  SuggestionApi._();

  static Future<SuggestionResponse> sendData(Suggestion model) async {
    //
    final _completer = Completer<SuggestionResponse>();

    try {
      final resp = await http.post(
        _url,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: model.toJson(),
      );

      if (resp.statusCode == 200) {
        //
        final _data = suggestionResponseFromJson(resp.body);
        _completer.complete(_data);
      }
    } catch (exc) {
      _completer.completeError(SuggestionResponse());
    }

    return _completer.future;
  }
}
