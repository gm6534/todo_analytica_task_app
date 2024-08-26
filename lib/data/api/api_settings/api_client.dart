import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'handle_exception.dart';
import 'handle_response.dart';

class APIClient {
  static Future<dynamic> get(
      {String baseUrl = "", String endpoint = ""}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      return ApiCall.handleResponse(response);
    } on SocketException catch (e) {
      throw APIException(
          'Failed to connect to the server. Error: ${e.osError?.message}. Please use stable internet connection');
    } on TimeoutException catch (e) {
      throw APIException(
          'Request timed out. Error: ${e.message}. Please use stable internet connection');
    } catch (e) {
      throw APIException(
          'Failed to post data to API: ${e.toString().split(", uri=").first}, Try Again!');
    }
  }

  static Future<dynamic> post(
      {String baseUrl = "",
      String endpoint = "",
      dynamic data,
      dynamic header}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: header ??
            <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
        body: jsonEncode(data),
      );
      return ApiCall.handleResponse(response);
    } on SocketException catch (e) {
      throw APIException(
          'Failed to connect to the server. Error: ${e.osError?.message}. Please use stable internet connection');
    } on TimeoutException catch (e) {
      throw APIException(
          'Request timed out. Error: ${e.message}. Please use stable internet connection');
    } catch (e) {
      throw APIException(
          'Failed to post data to API: ${e.toString().split(", uri=").first}, Try Again!');
    }
  }
}
