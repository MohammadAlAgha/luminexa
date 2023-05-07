import 'package:luminexa_mobile/models/historyModel.dart';

class Led {
  final String id;
  final String ledName;
  int intensity;
  String ledStatus;
  String color;
  final List<History> histrory;

  Led({
    required this.id,
    required this.ledName,
    required this.intensity,
    required this.ledStatus,
    required this.color,
    required this.histrory,
  });

  Led copyWith({
    String? ledName,
    int? intensity,
    String? ledStatus,
    String? color,
    List<History>? histrory,
  }) {
    return Led(
      id: this.id,
      ledName: ledName ?? this.ledName,
      intensity: intensity ?? this.intensity,
      ledStatus: ledStatus ?? this.ledStatus,
      color: color ?? this.color,
      histrory: histrory ?? this.histrory,
    );
  }
}
