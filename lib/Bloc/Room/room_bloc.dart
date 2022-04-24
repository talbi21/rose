import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Room.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  List<RoomCart> room = [];

  RoomBloc() : super(RoomInitial()) {
    on<OnAddOrDeleteRoomFavoriteEvent>(_addOrDeleteRoomFavorite);
    on<OnAddRoomToCartEvent>(_addRoomToCart);
    on<OnDeleteRoomToCartEvent>(_deleteRoomCart);
    on<OnPlusQuantityRoomEvent>(_plusQuantityRoom);
    on<OnSubtractQuantityRoomEvent>(_subtractQuantityRoom);
    on<OnClearRoomsEvent>(_clearRoom);
    on<OnSaveRoomsBuyToDatabaseEvent>(_saveRoomToDatabase);
    on<OnSelectPathImageRoomEvent>(_selectImageForRoom);
    on<OnSaveNewRoomEvent>(_addNewRoom);
  }

  Future<void> _addOrDeleteRoomFavorite(
      OnAddOrDeleteRoomFavoriteEvent event, Emitter<RoomState> emit) async {
/*
    try {

      emit(LoadingRoomState());

      final data = await roomServices.addOrDeleteRoomFavorite(event.uidRoom);

      if(data.resp){
        emit(SuccessRoomState());
      }else{
        emit(FailureRoomState(data.message));
      }

    } catch (e) {
      emit(FailureRoomState(e.toString()));
    }


 */
  }

  Future<void> _addRoomToCart(
      OnAddRoomToCartEvent event, Emitter<RoomState> emit) async {
    final hasRoom = room.contains(event.room);

    if (!hasRoom) {
      room.add(event.room);

      double sum = 0;

      room.forEach((e) => sum = sum + e.price);

      emit(SetAddRoomToCartState(rooms: room, total: sum, amount: room.length));
    }
  }

  Future<void> _deleteRoomCart(
      OnDeleteRoomToCartEvent event, Emitter<RoomState> emit) async {
    room.removeAt(event.index);

    double sum = 0;
    room.forEach((e) => sum = sum + e.price);

    emit(SetAddRoomToCartState(rooms: room, total: sum, amount: room.length));
  }

  Future<void> _plusQuantityRoom(
      OnPlusQuantityRoomEvent event, Emitter<RoomState> emit) async {
    room[event.plus].amount++;

    double total = 0;
    room.forEach((e) => total = total + (e.price * e.amount));

    emit(SetAddRoomToCartState(rooms: room, total: total, amount: room.length));
  }

  Future<void> _subtractQuantityRoom(
      OnSubtractQuantityRoomEvent event, Emitter<RoomState> emit) async {
    room[event.subtract].amount--;

    double total = 0;
    room.forEach((e) => total = total - (e.price * e.amount));

    emit(SetAddRoomToCartState(
        rooms: room, total: total.abs(), amount: room.length));
  }

  Future<void> _clearRoom(
      OnClearRoomsEvent event, Emitter<RoomState> emit) async {
    room.clear();
    emit(RoomInitial());
  }

  Future<void> _saveRoomToDatabase(
      OnSaveRoomsBuyToDatabaseEvent event, Emitter<RoomState> emit) async {
/*
    try {

      emit(LoadingRoomState());

      final data = await roomServices.saveOrderBuyRoomToDatabase('Ticket', event.amount, event.room);

      if(data.resp){
        emit(SuccessRoomState());
      }else{
        emit(FailureRoomState(data.message));
      }

    } catch (e) {
      emit(FailureRoomState(e.toString()));
    }

 */
  }

  Future<void> _selectImageForRoom(
      OnSelectPathImageRoomEvent event, Emitter<RoomState> emit) async {
    emit(SetImageForRoomState(event.image));
  }

  Future<void> _addNewRoom(
      OnSaveNewRoomEvent event, Emitter<RoomState> emit) async {
/*
    try {

      emit(LoadingRoomState());

      final data = await roomServices.addNewRoom(event.name, event.description, event.stock, event.price);

      if(data.resp){
        emit(SuccessRoomState());
      }else{
        emit(FailureRoomState(data.message));
      }

    } catch (e) {
      emit(FailureRoomState(e.toString()));
    }

 */
  }
}
