part of 'room_bloc.dart';

@immutable
abstract class RoomState {

  final List<RoomCart>? rooms;
  final double total;
  final int amount;
  final double delivery;
  final double insurance;
  final String? pathImage;

  RoomState({
    this.rooms,
    this.total  = 00.0,
    this.amount = 0,
    this.delivery  = 15.0,
    this.insurance = 10.0,
    this.pathImage
  });
}

class RoomInitial extends RoomState {

  RoomInitial(): super(rooms: [], total: 00.0, amount: 0);
}

class LoadingRoomState extends RoomState {}

class SuccessRoomState extends RoomState {}

class FailureRoomState extends RoomState {
  final String error;

  FailureRoomState(this.error);
}


class SetAddRoomToCartState extends RoomState{
  final List<RoomCart> rooms;
  final double total;
  final int amount;

  SetAddRoomToCartState({
    required this.rooms,
    required this.total,
    required this.amount
  }):super(rooms: rooms, total: total, amount: amount);
}


class SetImageForRoomState extends RoomState {
  final String path;

  SetImageForRoomState(this.path):super(pathImage: path);
}











