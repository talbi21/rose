import 'dart:async';
import 'package:finalrose/Bloc/Home/home_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helpers/secure_storage_frave.dart';
import '../../Service/auth_services.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final secureStorage2 = FlutterSecureStorage();


  AuthBloc() : super(AuthInitial()){

    on<LoginEvent>( _login );
    on<CheckLoginEvent>( _checkingLogin );
    on<LogOutEvent>( _logout );
  }


  Future<void> _login(LoginEvent event, Emitter<AuthState> emit ) async {
    final prefs = await SharedPreferences.getInstance();


    try {

      emit(LoadingAuthState());

      final data = await authServices.login(email: event.email, password: event.password);
      print(event.email);
      print(event.password);

      await Future.delayed(Duration(milliseconds: 350));

      if( data.resp ){

        await secureStorage.deleteSecureStorage();

        await secureStorage.persistenToken(data.token);
        print(data.token);
        await prefs.setString('token',data.token);
        String? test =  prefs.getString('token');
        print(test);
        await prefs.setString('email',event.email);
        print(event.email);

        emit(SuccessAuthState());



      } else {
        emit(FailureAuthState(error: data.message ));
        print(data.message);
      }

    } catch (e) {
      emit(FailureAuthState(error: e.toString()));
      print(e.toString());
    }

  }


  Future<void> _checkingLogin( CheckLoginEvent event, Emitter<AuthState> emit ) async {
    final prefs = await SharedPreferences.getInstance();
    try {
print('test');
      emit(LoadingAuthState());
final String? token = prefs.getString('token');
print("here"+token!);
      if( token != null ){

        print('oui1');
        final String? usermail = prefs.getString('email');
        print("here"+usermail!);
    //  String email =  secureStorage2.read(key: 'email') as String;
        final data = await authServices.renewToken( email: usermail);

        if( data.resp ){
          print('oui2');
          await secureStorage.persistenToken(data.token);
          await prefs.setString('token',data.token);


          emit(SuccessAuthState());

        }else{
          print('non');
          await secureStorage.deleteSecureStorage();

          emit(LogOutState());
        }

      }else{
        print('non2');
        await secureStorage.deleteSecureStorage();
        final success = await prefs.remove('email');
        final success2 = await prefs.remove('token');
        emit(LogOutState());
      }

    } catch (e) {
      print('non3'+e.toString());
      await secureStorage.deleteSecureStorage();

      final success = await prefs.remove('email');
      final success2 = await prefs.remove('token');
      emit(LogOutState());
    }

  }


  Future<void> _logout(LogOutEvent event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('email');
    final success2 = await prefs.remove('token');
    print(success2);
    secureStorage.deleteSecureStorage();

    emit(LogOutState());
  }


}
