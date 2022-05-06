import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Models/House.dart';
import '../../Models/Response/resonse_home.dart';
import '../../Service/home_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<OnGetHomeEvent>(_getHome);
    //  on<OnUpdateProfilePictureEvent>(_updatePictureProfile);
    //  on<OnUpdateInformationHomeEvent>(_updateInformationHome);
    //  on<OnUpdateStreetAdressEvent>(_updateStreetAddress);
  }

  Future<void> _getHome(OnGetHomeEvent event, Emitter<HomeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? homemail = prefs.getString('email');
    print("here3"+homemail!);
    try {
      emit(LoadingHomeState());
    final home = await homeServices.getHomeById(email:homemail);

    emit(SetHomeState(home: home.house[0]));
      emit(SuccessHomeState());

      for (var i = 0; i < home.house.length; i++) {

        print("NAME"+" "+home.house[i].name);
        final list =<String>[home.house[i].name];


        prefs.setStringList("homes", list);


      }

      final String listenames = prefs.getStringList("homes") as String;
      print(listenames.toString()+"listeeeeee");

    } catch (e) {
      print(e);
      emit(FailureHomeState(e.toString()));
    }
  }











/*
  Future<void> _updatePictureProfile(
      OnUpdateProfilePictureEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());

      final data = await homeServices.updatePictureProfile(event.pathProfile);

      if (data.resp) {
        final home = await homeServices.getHomeById();
        emit(SetHomeState(home: home));
      } else {
        emit(FailureHomeState(data.message));
      }
    } catch (e) {
      emit(FailureHomeState(e.toString()));
    }
  }



  Future<void> _updateInformationHome(
      OnUpdateInformationHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());

      final data = await homeServices.updateInformationHome(event.firstname,
          event.lastname, event.number, event.street, event.reference);

      if (data.resp) {
        final home = await homeServices.getHomeById();
        emit(SetHomeState(home: home));
      } else {
        emit(FailureHomeState(data.message));
      }
    } catch (e) {
      emit(FailureHomeState(e.toString()));
    }
  }

  Future<void> _updateStreetAddress(
      OnUpdateStreetAdressEvent event, Emitter<HomeState> emit) async {
    try {
      emit(LoadingHomeState());

      final data =
          await homeServices.updateStreetAddress(event.street, event.reference);

      if (data.resp) {
        final home = await homeServices.getHomeById( email: homemail);
        emit(SetHomeState(home: home));
      } else {
        emit(FailureHomeState(data.message));
      }
    } catch (e) {
      emit(FailureHomeState(e.toString()));
    }


  }

 */


}
