import 'package:luminexa_mobile/models/historyModel.dart';

class Led {
  final String id;
  final String ledName;
  final int intensity;
  final String ledStatus;
  final String color;
  final List<History> histrory;

  Led({
    required this.id,
    required this.ledName,
    required this.intensity,
    required this.ledStatus,
    required this.color,
    required this.histrory,
  });
}
