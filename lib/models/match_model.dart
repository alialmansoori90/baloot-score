import 'package:hive_flutter/hive_flutter.dart';

part 'match_model.g.dart';

@HiveType(typeId: 0)
class MatchModel {
  @HiveField(0)
  String teamAName;

  @HiveField(1)
  String teamBName;

  @HiveField(2)
  int teamAScore;

  @HiveField(3)
  int teamBScore;

  @HiveField(4)
  List<Round> rounds;

  @HiveField(5)
  bool isFinished;

  MatchModel({
    required this.teamAName,
    required this.teamBName,
    this.teamAScore = 0,
    this.teamBScore = 0,
    this.rounds = const [],
    this.isFinished = false,
  });

  void addRound(int teamAPoints, int teamBPoints) {
    teamAScore += teamAPoints;
    teamBScore += teamBPoints;
    rounds.add(Round(teamAPoints, teamBPoints));
  }

  void reset() {
    teamAScore = 0;
    teamBScore = 0;
    rounds = [];
    isFinished = false;
  }

  void finish() {
    isFinished = true;
  }
}

@HiveType(typeId: 1)
class Round {
  @HiveField(0)
  int teamAPoints;

  @HiveField(1)
  int teamBPoints;

  Round(this.teamAPoints, this.teamBPoints);
}