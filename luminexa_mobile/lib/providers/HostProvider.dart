import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/HostAPIs.dart';
import 'package:luminexa_mobile/models/SystemUserModel.dart';

class HostProvider extends ChangeNotifier {
  List<SystemUser> systemUsers = [];

  HostProvider({
    required this.systemUsers,
  });

  Future<void> getSystemUsers(systemId) async {
    final response = await HostAPIs.getSystemUsers(systemId);

    List<SystemUser> _systemUsers = [];

    response.forEach(
      (map) {
        final SystemUser user = SystemUser.fromJSON(map);
        _systemUsers.add(user);
      },
    );

    systemUsers = _systemUsers;

    notifyListeners();
  }

  Future<void> deleteUser(systemId, email) async {
    final response = await HostAPIs.deleteUser(systemId, email);

    List<SystemUser> _systemUsers = [];

    response.forEach(
      (map) {
        final SystemUser user = SystemUser.fromJSON(map);
        _systemUsers.add(user);
      },
    );

    systemUsers = _systemUsers;

    notifyListeners();
  }

  Future<void> setHost(systemId, email) async {
    final response = await HostAPIs.setHost(systemId, email);

    List<SystemUser> _systemUsers = [];

    response.forEach(
      (map) {
        final SystemUser user = SystemUser.fromJSON(map);
        _systemUsers.add(user);
      },
    );

    systemUsers = _systemUsers;

    notifyListeners();
  }
}
