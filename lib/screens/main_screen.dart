import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardgame/core/theme/app_theme.dart';
import 'package:cardgame/models/match_model.dart';
import 'package:cardgame/providers/match_provider.dart';
import 'package:cardgame/storage/hive_service.dart';
import 'package:cardgame/screens/match_history_screen.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider);
    final matchNotifier = ref.read(matchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Saudi Baloot Score Tracker'),
        backgroundColor: AppTheme.teamAColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Team A Section
            Card(
              color: AppTheme.teamAColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      match.teamAName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${match.teamAScore}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(10, 0),
                          child: Text('+10'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamAColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(20, 0),
                          child: Text('+20'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamAColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(30, 0),
                          child: Text('+30'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamAColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Team B Section
            Card(
              color: AppTheme.teamBColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      match.teamBName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${match.teamBScore}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(0, 10),
                          child: Text('+10'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamBColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(0, 20),
                          child: Text('+20'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamBColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => matchNotifier.addRound(0, 30),
                          child: Text('+30'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppTheme.teamBColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => matchNotifier.reset(),
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await HiveService.saveMatch(match);
                    matchNotifier.reset();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Match saved!')),
                    );
                  },
                  child: Text('Save & Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.teamAColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Match History Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MatchHistoryScreen(),
                  ),
                );
              },
              icon: Icon(Icons.history),
              label: Text('Match History'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}