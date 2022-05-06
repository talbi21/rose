class RoomCart {
  final String uidRoom;

  final String name;
  String houseID;


  RoomCart({
    required this.uidRoom,
    required this.name,
   required this.houseID,

  });

  Map<String, dynamic> toJson() {
    return {'uidRoom': uidRoom, 'houseId': houseID,'name':name};
  }
}
