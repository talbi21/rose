import 'dart:convert';

import 'package:finalrose/Models/House.dart';
import 'package:finalrose/Service/urls.dart';
import 'package:http/http.dart' as http;


import '../Models/Response/resonse_home.dart';


class HomeServices {


  Future<ResponseHome> getHomeById( {required String? email}) async {
    final resp = await http.post(Uri.parse('${URLS.baseUrl6000}/houses/two'),
        headers: {'Accept': 'application/json'},
        body: {'owner': email});
    print("email"+email!);
    var jsonString = resp.body;
    var jsonMap = json.decode(jsonString);


    var userModel = ResponseHome.fromJson(jsonMap);
    print("usermodel"+userModel.house.toString());
    return userModel;
  }






}

final homeServices = HomeServices();