
class RoomCart {

  final String uidRoom;

  final String name;
  double price;
  int amount;

  RoomCart({
    required this.uidRoom,

    required this.name, 
    required this.price,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'uidRoom': uidRoom,
      'price' : price,
      'amount': amount
    };
  }
}