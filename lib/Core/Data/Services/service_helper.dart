import 'dart:convert';

import 'package:flicker_search/Core/Utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ServiceHelper {
  static final ServiceHelper _singleton = ServiceHelper._internal();
  factory ServiceHelper() => _singleton;
  ServiceHelper._internal();

  Future<Map<String, dynamic>?> request(
    String url, {
    required HttpRequestMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final client = Client();
    final jsonEncodedBody = jsonEncode(body ?? {});

    try {
      switch (method) {
        case HttpRequestMethod.get:
          // Handle Get Requests & Response
          return _responseHandler(
              await client.get(Uri.parse(url), headers: headers));
        case HttpRequestMethod.post:
          // Handle Post Requests & Response
          return _responseHandler(await client.post(Uri.parse(url),
              headers: headers, body: jsonEncodedBody));
        case HttpRequestMethod.put:
        // Handle Put Requests & Response
        case HttpRequestMethod.delete:
        // Handle Delete Requests & Response
        default:
          return null;
      }
    } catch (e) {
      debugPrint(
          '\n::::: API CALL ERROR ::::: \nURL($method): $url \nBODY: $jsonEncodedBody \nERROR: $e\n\n:::::::::::::::');
      return null;
    }
  }

  Future<Map<String, dynamic>?> _responseHandler(Response response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
