import 'dart:convert';



ResponseHome responseHomeFromJson(String str) =>
    ResponseHome.fromJson(json.decode(str));

String responseHomeToJson(ResponseHome data) => json.encode(data.toJson());

class ResponseHome {
  ResponseHome({
    required this.resp,
    required this.message,
    required this.house,
  });

  bool resp;
  String message;
  List<House> house;

  factory ResponseHome.fromJson(Map<String, dynamic> json) => ResponseHome(
    resp: json["resp"],
    message: json["message"],
    house: List<House>.from(json["House1"].map((x) => House.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resp": resp,
    "message": message,
    "House1": List<dynamic>.from(house.map((x) => x.toJson())),
  };
}


class House {
  House({
    required this.id,
    required this.name,
    required this.owner,

  });


  String id;
  String name;
  String owner;


  factory House.fromJson(Map<String, dynamic> json) => House(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    owner: json["owner"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "owner": owner,

  };
}


