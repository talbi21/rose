part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final famillyMember? user;

  UserState({
    this.user,
  });
}

class UserInitial extends UserState {}

class SetUserState extends UserState {
  final famillyMember user;

  SetUserState({required this.user}) : super(user: user);
}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}

class FailureUserState extends UserState {
  final error;

  FailureUserState(this.error);
}
