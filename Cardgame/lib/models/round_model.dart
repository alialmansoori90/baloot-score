import 'package:hive/hive.dart';

part 'round_model.g.dart';

@HiveType(typeId: 1)
class RoundModel {
  @HiveField(0)
  int teamAScore;

  @HiveField(1)
  int teamBScore;

  @HiveField(2)
  DateTime timestamp;

  RoundModel({
    required this.teamAScore,
    required this.teamBScore,
    required this.timestamp,
  });
}