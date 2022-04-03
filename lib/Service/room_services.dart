/*
import 'dart:convert';
import 'package:finalrose/Service/urls.dart';
import 'package:http/http.dart' as http;

import '../Helpers/secure_storage_frave.dart';


class RoomServices {


  Future<List<SlideRoom>> listRoomsHomeCarousel() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-home-products-carousel'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );

    return ResponseSlideRooms.fromJson(jsonDecode(resp.body)).slideRooms;
  }


  Future<List<Categories>> listCategoriesHome() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/category/get-all-categories'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseCategoriesHome.fromJson(jsonDecode(resp.body)).categories;
  }


  Future<List<ListRooms>> listRoomsHome() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-products-home'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseRoomsHome.fromJson(jsonDecode(resp.body)).listRooms;
  }


  Future<ResponseDefault> addOrDeleteRoomFavorite(String uidRoom) async {

    final token = await secureStorage.readToken();

    final resp = await http.post(Uri.parse('${URLS.urlApi}/product/like-or-unlike-product'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
      body: {
        'uidRoom' : uidRoom
      }
    );
    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }


  Future<List<Categories>> getAllCategories() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/category/get-all-categories'),
      headers: { 'Accept': 'application/json', 'xxx-token' : token! }
    );
    return ResponseCategoriesHome.fromJson(jsonDecode(resp.body)).categories;
  }


  Future<List<ListRooms>> allFavoriteRooms() async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-all-favorite'),
      headers: { 'Accept'   : 'application/json', 'xxx-token' : token! },
    );

    return ResponseRoomsHome.fromJson(jsonDecode(resp.body)).listRooms;
  }


  Future<List<ListRooms>> getRoomsForCategories(String id) async {

    final token = await secureStorage.readToken();

    final resp = await http.get(Uri.parse('${URLS.urlApi}/product/get-products-for-category/'+ id ),
      headers: { 'Content-type'   : 'application/json', 'xxx-token' : token! },
    );

    return ResponseRoomsHome.fromJson(jsonDecode(resp.body)).listRooms;
  }


  Future<ResponseDefault> saveOrderBuyRoomToDatabase(String receipt, String amount, List<RoomCart> products) async {

    final token = await secureStorage.readToken();

    Map<String, dynamic> data = {
      'receipt' : receipt,
      'amount'  : amount,
      'products': products
    };

    final body = json.encode( data );
    
    final resp = await http.post(Uri.parse('${URLS.urlApi}/product/save-order-buy-product'),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
      body: body
    );

    return ResponseDefault.fromJson( jsonDecode( resp.body ) );
  }


  Future<ResponseDefault> addNewRoom(String name, String description, String stock, String price, String uidCategory, String image) async {

    final token = await secureStorage.readToken();

    var request = http.MultipartRequest('POST', Uri.parse('${URLS.urlApi}/product/add-new-product'))
      ..headers['Accept'] = 'application/json'
      ..headers['xxx-token'] = token!
      ..fields['name'] = name
      ..fields['description'] = description
      ..fields['stock'] = stock
      ..fields['price'] = price
      ..fields['uidCategory'] = uidCategory
      ..files.add( await http.MultipartFile.fromPath('productImage', image));

    final resp = await request.send();
    var data = await http.Response.fromStream( resp );

    return ResponseDefault.fromJson(jsonDecode(data.body));
  } 


  Future<List<OrderBuy>> getPurchasedRooms() async {

    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse('${URLS.urlApi}/product/get-all-purchased-products'),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
    );
    return ResponseOrderBuy.fromJson(jsonDecode( response.body )).orderBuy;
  }


  Future<List<OrderDetail>> getOrderDetails(String uidOrder) async {

    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse('${URLS.urlApi}/product/get-orders-details/'+ uidOrder),
      headers: { 'Content-type' : 'application/json', 'xxx-token' : token! },
    );
    return ResponseOrderDetails.fromJson(jsonDecode( response.body )).orderDetails;
  }


 


  
}
final productServices = RoomServices();

 */
