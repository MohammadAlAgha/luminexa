import 'package:luminexa_mobile/models/systemModel.dart';

class Notifications {
  final String id;
  final DateTime time;
  final System systemId;
  final String description;

  Notifications({
    required this.id,
    required this.time,
    required this.systemId,
    required this.description,
  });
}
