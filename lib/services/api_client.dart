import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

/// HTTP client wrapper cho LiveBoard API
class ApiClient {
  ApiClient._();

  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true',
    };
  }

  /// GET request
  static Future<http.Response> get(String path) {
    return http.get(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: _headers(),
    );
  }

  /// POST request
  static Future<http.Response> post(String path, dynamic body) {
    return http.post(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  /// PUT request
  static Future<http.Response> put(String path, dynamic body) {
    return http.put(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  /// DELETE request
  static Future<http.Response> delete(String path) {
    return http.delete(
      Uri.parse('${ApiConfig.baseUrl}$path'),
      headers: _headers(),
    );
  }
}
