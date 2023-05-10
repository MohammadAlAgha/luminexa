import 'package:luminexa_mobile/models/systemModel.dart';

class User {
  final String name;
  final String email;
  final bool isHost;

  User({
    required this.name,
    required this.email,
    required this.isHost,
  });

  static User fromJSON(Map json) {
    final User newUser = User(
      name: json["userName"],
      email: json["email"],
      isHost: false,
    );

    return newUser;
  }
}
