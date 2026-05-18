import 'package:hive_flutter/hive_flutter.dart';
import 'package:cardgame/models/match_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MatchModelAdapter());
    Hive.registerAdapter(RoundAdapter());
    await Hive.openBox<MatchModel>('matches');
  }

  static Future<void> saveMatch(MatchModel match) async {
    final box = Hive.box<MatchModel>('matches');
    await box.add(match);
  }

  static Future<List<MatchModel>> getAllMatches() async {
    final box = Hive.box<MatchModel>('matches');
    return box.values.toList();
  }

  static Future<void> clearAllMatches() async {
    final box = Hive.box<MatchModel>('matches');
    await box.clear();
  }
}