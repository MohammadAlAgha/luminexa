import 'package:luminexa_mobile/models/systemModel.dart';

class Notifications {
  final DateTime time;
  final System systemId;
  final String description;

  Notifications({
    required this.time,
    required this.systemId,
    required this.description,
  });
}
