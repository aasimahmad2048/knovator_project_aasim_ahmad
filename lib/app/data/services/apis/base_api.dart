import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Accept": "application/json",
  };

  Future<ApiResponse<T>> getRequestApi<T>(
    String endpoint, {
    T Function(dynamic json)? fromJson,
  }) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: headers,
      );

      // if (kDebugMode) {
      //   print("API CALL: $baseUrl$endpoint");
      //   print("STATUS: ${response.statusCode}");
      //   print("BODY: ${response.body}");
      // }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final jsonData = jsonDecode(response.body);

        if (fromJson != null) {
          return ApiResponse.success(fromJson(jsonData));
        } else {
          return ApiResponse.success(jsonData);
        }
      } else {
        return ApiResponse.failed("API Error: ${response.statusCode}");
      }
    } catch (e) {
      return ApiResponse.failed(e.toString());
    }
  }
}

class ApiResponse<T> {
  final bool status;
  final String? message;
  final T? data;

  ApiResponse({required this.status, this.message, this.data});

  factory ApiResponse.success(T data) {
    return ApiResponse(status: true, message: '', data: data);
  }

  factory ApiResponse.failed(String message) {
    return ApiResponse(status: false, message: message, data: null);
  }
}
