import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:unify/utils/secure_storage_util.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static final String baseUrl = dotenv.env['API_URL'] ?? '';

  static Future<Map<String, String>> _getHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final token = await SecureStorageUtil.getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> post(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = await _getHeaders();
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  static Future<http.Response> put(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = await _getHeaders();
    final response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    return response;
  }

  static Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = await _getHeaders();
    final response = await http.delete(url, headers: headers);
    return response;
  }
}
