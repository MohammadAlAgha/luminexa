import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/SystemAPIs.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:provider/provider.dart';

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

  Future<void> addSystem(serialNumber) async {
    final response = await SystemAPIs.addSystem(serialNumber);
    List<System> _systems = [];

    response.data["systems"].forEach((map) {
      final System system = fromJSON(map);
      _systems.add(system);
    });

    systems = _systems;

    notifyListeners();
  }

  void updateLed(String systemId, Led led) {
    final System system = systems.firstWhere((system) => systemId == system.id);

    for (var i = 0; i < system.leds.length; i++) {
      if (system.leds[i].id == led.id) {
        system.leds[i] = led;
      }
    }

    notifyListeners();
  }

  System fromJSON(Map json) {
    List<Schedule> parsedSchedules = [];
    json["schedules"].forEach((schedule) {
      parsedSchedules.add(SchedulesProvider.fromJSON(schedule));
    });
    List<Mode> parsedModes = [];
    json["modes"].forEach((mode) {
      parsedModes.add(ModesProvider.fromJSON(mode));
    });
    List<Led> parsedLeds = [];
    json["leds"].forEach((led) {
      parsedLeds.add(LedsProvider.fromJSON(led));
    });
    final System newSystem = System(
      id: json["_id"],
      hosts: [],
      users: [],
      systemName: json["systemName"],
      serialNumber: json["serialNumber"],
      leds: parsedLeds,
      modes: parsedModes,
      schedules: parsedSchedules,
    );

    return newSystem;
  }
}
