// ignore_for_file: prefer_single_quotes
import 'dart:convert';

SuggestionResponse suggestionResponseFromJson(String str) =>
    SuggestionResponse.fromJson(json.decode(str));

String suggestionResponseToJson(SuggestionResponse data) =>
    json.encode(data.toJson());

class SuggestionResponse {
  SuggestionResponse({
    this.response,
    this.status,
  });

  String response;
  bool status;

  factory SuggestionResponse.fromJson(Map<String, dynamic> json) =>
      SuggestionResponse(
        response: json["response"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "status": status,
      };
}
