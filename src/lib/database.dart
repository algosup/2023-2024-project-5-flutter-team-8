class User {
  final String fullName;
  final String email;
  final String password;

  User({required this.fullName, required this.email, required this.password});
}

List<User> users = [
  User(fullName: 'Quentin Clément', email: 'quentin.clement@algosup.com', password: '12345'),
];
