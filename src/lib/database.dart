class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

List<User> users = [
  User(email: 'quentin.clement@algosup.com', password: '12345'),
  // Add other users here
];
