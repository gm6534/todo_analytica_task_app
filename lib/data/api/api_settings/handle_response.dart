import 'dart:convert';
import 'package:http/http.dart' as http;

import 'handle_exception.dart';

class ApiCall {
  static dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw APIException('Bad request. Status code: 400');
      case 401:
        throw APIException('Unauthorized. Status code: 401');
      // Add cases for other status codes as needed
      default:
        throw APIException('Failed with status code: ${response.statusCode}');
    }
  }
}
