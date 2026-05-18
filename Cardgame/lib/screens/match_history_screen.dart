import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardgame/core/theme/app_theme.dart';
import 'package:cardgame/models/match_model.dart';
import 'package:cardgame/storage/hive_service.dart';

class MatchHistoryScreen extends ConsumerWidget {
  MatchHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match History'),
        backgroundColor: AppTheme.teamAColor,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<MatchModel>>(
        future: HiveService.getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading matches: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No matches found'),
            );
          }

          final matches = snapshot.data!;

          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text('${match.teamAName} vs ${match.teamBName}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Score: ${match.teamAScore} - ${match.teamBScore}'),
                      Text('Rounds: ${match.rounds.length}'),
                      Text(
                        match.isFinished
                            ? 'Finished'
                            : 'In Progress',
                        style: TextStyle(
                          color: match.isFinished
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          );
        },
      ),
    );
  }
}