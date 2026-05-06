import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/campus_data.dart';
import '../models/building.dart';
import '../widgets/building_card.dart';
import '../widgets/search_bar.dart';
import '../utils/page_route.dart';
import '../utils/spacing.dart';

import 'building_detail_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Building> filtered = campusBuildings;
  List<bool> visibleItems = [];

  @override
  void initState() {
    super.initState();

    visibleItems = List.generate(campusBuildings.length, (_) => false);

    loadFavorites();
    _runAnimation();
  }

  void _runAnimation() {
    for (int i = 0; i < campusBuildings.length; i++) {
      Future.delayed(Duration(milliseconds: 120 * i), () {
        if (!mounted) return;
        setState(() => visibleItems[i] = true);
      });
    }
  }

  void search(String query) {
    setState(() {
      filtered = campusBuildings
          .where((b) =>
              b.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void reset() {
    setState(() => filtered = campusBuildings);
  }

  void toggleFav(Building b) {
    setState(() => b.isFavorite = !b.isFavorite);
    saveFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
      "fav",
      campusBuildings.where((b) => b.isFavorite).map((b) => b.name).toList(),
    );
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList("fav") ?? [];

    for (var b in campusBuildings) {
      b.isFavorite = favs.contains(b.name);
    }

    setState(() {});
  }

  Widget _buildHeader() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade400,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome 👋",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 6),
          Text(
            "ASTU Campus Navigator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campus Navigator"),

        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: widget.onToggleTheme,
          ),

          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                FadePageRoute(page: const MapScreen()),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                FadePageRoute(page: const FavoritesScreen()),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                FadePageRoute(page: const AboutScreen()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          _buildHeader(),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SearchBarWidget(
              onChanged: search,
              onClear: reset,
            ),
          ),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final b = filtered[i];

                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: visibleItems[i] ? 1 : 0,
                  curve: Curves.easeOut,

                  child: Transform.translate(
                    offset: visibleItems[i]
                        ? const Offset(0, 0)
                        : const Offset(0, 20),

                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSpacing.md,
                      ),

                      child: BuildingCard(
                        building: b,
                        onTap: () {
                          Navigator.push(
                            context,
                            FadePageRoute(
                              page: BuildingDetailScreen(building: b),
                            ),
                          );
                        },
                        onFavorite: () => toggleFav(b),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}