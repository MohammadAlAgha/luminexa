import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/SystemAPIs.dart';
import 'package:luminexa_mobile/models/systemModel.dart';

class SystemsProvider extends ChangeNotifier {
  List<System> systems;

  SystemsProvider({
    required this.systems,
  });

  Future<void> getAllSystems() async {
    final response = await SystemAPIs.getAllSystems();

    List<System> _systems = [];

    response.data.forEach((map) {
      final System system = fromJSON(map);
      _systems.add(system);
    });

    systems = _systems;

    notifyListeners();
  }

  Future<List<System>> addSystem(serialNumber) async {
    final Response = await SystemAPIs.addSystem(serialNumber);
    return Response;
  }

  System fromJSON(Map json) {
    final System newSystem = System(
      hosts: [],
      users: [],
      systemName: json["systemName"],
      serialNumber: json["serialNumber"],
      leds: [],
      modes: [],
      schedule: [],
    );

    return newSystem;
  }
}
