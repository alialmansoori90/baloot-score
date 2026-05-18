import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardgame/models/match_model.dart';

final matchProvider = StateNotifierProvider<MatchNotifier, MatchModel>((ref) {
  return MatchNotifier();
});

class MatchNotifier extends StateNotifier<MatchModel> {
  MatchNotifier() : super(MatchModel(teamAName: 'Team A', teamBName: 'Team B'));

  void addRound(int teamAPoints, int teamBPoints) {
    state = MatchModel(
      teamAName: state.teamAName,
      teamBName: state.teamBName,
      teamAScore: state.teamAScore + teamAPoints,
      teamBScore: state.teamBScore + teamBPoints,
      rounds: List.from(state.rounds)..add(Round(teamAPoints, teamBPoints)),
      isFinished: state.isFinished,
    );
  }

  void reset() {
    state = MatchModel(
      teamAName: state.teamAName,
      teamBName: state.teamBName,
      teamAScore: 0,
      teamBScore: 0,
      rounds: [],
      isFinished: false,
    );
  }

  void finish() {
    state = MatchModel(
      teamAName: state.teamAName,
      teamBName: state.teamBName,
      teamAScore: state.teamAScore,
      teamBScore: state.teamBScore,
      rounds: state.rounds,
      isFinished: true,
    );
  }
}