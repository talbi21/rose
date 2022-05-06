part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnAddNewHome extends HomeEvent {
  final String homename;
  final String email;
  final String password;

  OnAddNewHome(this.homename, this.email, this.password);
}

class OnGetHomeEvent extends HomeEvent {}

class OnUpdateProfilePictureEvent extends HomeEvent {
  final String pathProfile;

  OnUpdateProfilePictureEvent(this.pathProfile);
}

class OnUpdateInformationHomeEvent extends HomeEvent {
  final String firstname;
  final String lastname;
  final String number;
  final String street;
  final String reference;

  OnUpdateInformationHomeEvent(
      this.firstname, this.lastname, this.number, this.street, this.reference);
}

class OnUpdateStreetAdressEvent extends HomeEvent {
  final String street;
  final String reference;

  OnUpdateStreetAdressEvent(this.street, this.reference);
}
