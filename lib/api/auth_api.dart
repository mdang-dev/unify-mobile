import 'dart:convert';

import 'package:unify/api/api.dart';
import 'package:unify/constants/api_key.dart';
import 'package:unify/types/request/login.request.dart';

class AuthApi {
  static Future<String> login(LoginRequest request) async {
    final repsonse = await HttpClient.post(
        ApiKey.API_KEY['auth']['login'], request.toJson());
    if (repsonse.statusCode == 200) {
      throw Exception('Failed to login');
    }
    return jsonDecode(repsonse.body)['token'];
  }
}
