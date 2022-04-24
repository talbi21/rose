part of 'room_bloc.dart';

@immutable
abstract class RoomEvent {}

class OnAddOrDeleteRoomFavoriteEvent extends RoomEvent {
  final String uidRoom;

  OnAddOrDeleteRoomFavoriteEvent({required this.uidRoom});
}

class OnAddRoomToCartEvent extends RoomEvent {
  final RoomCart room;

  OnAddRoomToCartEvent(this.room);
}

class OnDeleteRoomToCartEvent extends RoomEvent {
  final int index;

  OnDeleteRoomToCartEvent(this.index);
}

class OnPlusQuantityRoomEvent extends RoomEvent {
  final int plus;

  OnPlusQuantityRoomEvent(this.plus);
}

class OnSubtractQuantityRoomEvent extends RoomEvent {
  final int subtract;

  OnSubtractQuantityRoomEvent(this.subtract);
}

class OnClearRoomsEvent extends RoomEvent {}

class OnSaveRoomsBuyToDatabaseEvent extends RoomEvent {
  final String amount;
  final List<RoomCart> room;

  OnSaveRoomsBuyToDatabaseEvent(this.amount, this.room);
}

class OnSelectPathImageRoomEvent extends RoomEvent {
  final String image;

  OnSelectPathImageRoomEvent(this.image);
}

class OnSaveNewRoomEvent extends RoomEvent {
  final String name;
  final String description;
  final String stock;
  final String price;
  final String uidCategory;
  final String image;

  OnSaveNewRoomEvent(this.name, this.description, this.stock, this.price,
      this.uidCategory, this.image);
}
