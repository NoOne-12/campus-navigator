import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusNavigatorApp());
}

class CampusNavigatorApp extends StatefulWidget {
  const CampusNavigatorApp({super.key});

  @override
  State<CampusNavigatorApp> createState() => _CampusNavigatorAppState();
}

class _CampusNavigatorAppState extends State<CampusNavigatorApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Campus Navigator",

      theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,

      home: MainScreen(
        onToggleTheme: toggleTheme,
        isDark: isDark,
      ),
    );
  }
}