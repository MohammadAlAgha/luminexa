import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/userModel.dart';
import 'package:luminexa_mobile/remoteDataSource/authDataSource.dart';

class UserProvider extends ChangeNotifier {
  User user;

  UserProvider({
    required this.user,
  });

  Future<void> login(email, password) async {
    final response = await AuthDataSource.login(email, password);
    print(response);

    response.data.forEach((map) => {
          user = User.fromJSON(map),
        });

    notifyListeners();
  }
}
