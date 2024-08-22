class CreateUserReq {
  final String email;
  final String password;
  final String fullName;

  CreateUserReq(
      {required this.email, required this.fullName, required this.password});
}
