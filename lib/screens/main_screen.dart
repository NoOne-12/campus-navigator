import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'favorites_screen.dart';
import 'map_screen.dart';
import 'about_screen.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const MainScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onToggleTheme: widget.onToggleTheme),
      const FavoritesScreen(),
      const MapScreen(),
      const AboutScreen(),
    ];

    return Scaffold(
      body: screens[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        showUnselectedLabels: false,
        showSelectedLabels: true,

        onTap: (i) {
          setState(() => index = i);
        },

        items: [
          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: index == 0 ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.home),
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: index == 1 ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.favorite),
            ),
            label: "Fav",
          ),

          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: index == 2 ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.map),
            ),
            label: "Map",
          ),

          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: index == 3 ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.info),
            ),
            label: "About",
          ),
        ],
      ),
    );
  }
}