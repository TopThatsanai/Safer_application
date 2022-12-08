class Profile {
  String username;
  late String password;
  late String confirmPassword;
  late String firstName;
  late String lastName;
  late String citizenId;
  late String email;
  late String phoneNumber;

  Profile({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.citizenId,
    required this.email,
    required this.phoneNumber,
  });
}
