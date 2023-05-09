import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/models/userModel.dart';

class System {
  final String id;
  final List<User> hosts;
  final List<User> users;
  final String systemName;
  final String serialNumber;
  final List<Led> leds;
  final List<Mode> modes;
  final List<Schedule> schedules;

  System({
    required this.id,
    required this.hosts,
    required this.users,
    required this.systemName,
    required this.serialNumber,
    required this.leds,
    required this.modes,
    required this.schedules,
  });
}
