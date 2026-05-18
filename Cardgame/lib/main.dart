import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cardgame/core/theme/app_theme.dart';
import 'package:cardgame/screens/main_screen.dart';
import 'package:cardgame/storage/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudi Baloot Score Tracker',
      theme: AppTheme.theme,
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}