import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardgame/core/theme/app_theme.dart';
import 'package:cardgame/models/match_model.dart';
import 'package:cardgame/providers/match_provider.dart';

class NewMatchScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teamATextField = TextEditingController();
  final TextEditingController _teamBTextField = TextEditingController();
  final TextEditingController _teamAScoreController = TextEditingController();
  final TextEditingController _teamBScoreController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Round'),
        backgroundColor: AppTheme.teamAColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _teamATextField,
                decoration: InputDecoration(
                  labelText: 'Team A Name',
                  border: OutlineInputBorder(),
                ),
                initialValue: match.teamAName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Team A name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _teamBTextField,
                decoration: InputDecoration(
                  labelText: 'Team B Name',
                  border: OutlineInputBorder(),
                ),
                initialValue: match.teamBName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Team B name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _teamAScoreController,
                      decoration: InputDecoration(
                        labelText: 'Team A Score',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Team A score';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _teamBScoreController,
                      decoration: InputDecoration(
                        labelText: 'Team B Score',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Team B score';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final teamAScore = int.parse(_teamAScoreController.text);
                    final teamBScore = int.parse(_teamBScoreController.text);

                    ref.read(matchProvider.notifier).addRound(teamAScore, teamBScore);

                    // Clear form
                    _teamATextField.clear();
                    _teamBTextField.clear();
                    _teamAScoreController.clear();
                    _teamBScoreController.clear();

                    // Close the screen
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Round'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.teamAColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}