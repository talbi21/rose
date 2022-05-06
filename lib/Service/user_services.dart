import 'dart:convert';

import 'package:finalrose/Service/urls.dart';
import 'package:http/http.dart' as http;

import '../Helpers/secure_storage_frave.dart';
import '../Models/Response/response_default.dart';
import '../Models/Response/response_user.dart';

class UserServices {
  Future<ResponseDefault> addNewUser(
      String username, String email, String password) async {
    final resp = await http.post(Uri.parse('${URLS.baseUrl}/register'),
        headers: {'Accept': 'application/json'},
        body: {'firstname': username, 'email': email, 'password': password});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<famillyMember> getUserById( {required String? email}) async {
    final resp = await http.post(Uri.parse('${URLS.baseUrl}/find'),
        headers: {'Accept': 'application/json'},
        body: {'email': email});


    return ResponseUser.fromJson(jsonDecode(resp.body)).user;
  }

  Future<ResponseDefault> updatePictureProfile(String image) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'PUT', Uri.parse('${URLS.baseUrl}/user/update-picture-profile'))
      ..headers['Accept'] = 'application/json'
      ..headers['xxx-token'] = token!
      ..files.add(await http.MultipartFile.fromPath('image', image));

    final resp = await request.send();
    var data = await http.Response.fromStream(resp);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }

  Future<ResponseDefault> updateInformationUser(String name, String last,
      String phone, String address, String reference) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(
        Uri.parse('${URLS.baseUrl}/user/update-information-user'),
        headers: {
          'Accept': 'application/json',
          'xxx-token': token!
        },
        body: {
          'firstname': name,
          'lastname': last,
          'phone': phone,
          'address': address,
          'reference': reference
        });

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> updateStreetAddress(
      String address, String reference) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(
        Uri.parse('${URLS.baseUrl}/user/update-street-address'),
        headers: {'Accept': 'application/json', 'xxx-token': token!},
        body: {'address': address, 'reference': reference});
    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }
}

final userServices = UserServices();
