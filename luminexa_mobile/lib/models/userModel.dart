import 'package:luminexa_mobile/models/systemModel.dart';

class User {
  final String name;
  final String email;
  final List<System> system;

  User({
    required this.name,
    required this.email,
    required this.system,
  });
}
