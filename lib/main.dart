import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: AppTheme.getLightTheme,
      darkTheme: AppTheme.getDarkTheme,
    );
  }
}
