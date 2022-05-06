part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final House? home;

  HomeState({
    this.home,
  });
}

class HomeInitial extends HomeState {}

class SetHomeState extends HomeState {
  final House home;

  SetHomeState({required this.home}) : super(home: home);
}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {


}


class FailureHomeState extends HomeState {
  final error;

  FailureHomeState(this.error);
}
