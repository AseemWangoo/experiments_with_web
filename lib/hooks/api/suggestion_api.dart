import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:experiments_with_web/hooks/models/suggestion.dart';
import 'package:experiments_with_web/hooks/models/suggestion_resp.dart';
import 'package:http/http.dart' as http;

const _url =
    'https://us-central1-fir-signin-4477d.cloudfunctions.net/TutorialSuggestion/tutorialSuggestion';

class SuggestionApi {
  SuggestionApi._();

  static Future<SuggestionResponse> sendData(Suggestion model) async {
    // BODY GEN
    final _body = <String, String>{
      'person_name': model.personName,
      'tutorial_name': model.tutorialName,
      'email': model.email,
      'media_handle': model.handle,
      'tutorial_desc': model.tutorialDesc,
    };

    try {
      final resp = await http.post(
        _url,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(_body),
      );

      if (resp.statusCode == 200) {
        //
        final _data = suggestionResponseFromJson(resp.body);
        return _data;
      }
    } catch (exc) {
      print('ERROR ${exc.toString()}');
    }

    return SuggestionResponse();
  }
}
