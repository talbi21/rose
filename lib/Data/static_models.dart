class StaticUser {
  int uid;
  String email;
  String password;
  String firstName;
  String lastName;
  String birthdate;
  String gender;
  String pictureId;
  bool isVerified;
  String role;

  StaticUser(this.uid, this.email, this.password, this.firstName, this.lastName,
      this.birthdate, this.gender, this.pictureId, this.isVerified, this.role);
}