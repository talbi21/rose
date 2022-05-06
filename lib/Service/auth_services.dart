import 'dart:convert';

import 'package:finalrose/Service/urls.dart';
import 'package:http/http.dart' as http;

import '../Helpers/secure_storage_frave.dart';
import '../Models/Response/response_auth.dart';

class AuthServices {
  Future<ResponseAuth> login(
      {required String email, required String password}) async {
    final resp = await http.post(Uri.parse('${URLS.baseUrl}/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    return ResponseAuth.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseAuth> renewToken( {required String? email}) async {
    final resp = await http.post(Uri.parse('${URLS.baseUrl}/renew-login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email});

    return ResponseAuth.fromJson(jsonDecode(resp.body));
  }
/*
  Future<ResponseAuth> renewToken2() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.baseUrl}/renew-login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    return ResponseAuth.fromJson(jsonDecode(resp.body));
  }

 */


}

final authServices = AuthServices();
