import 'package:flutter/material.dart';
import '../data/campus_data.dart';
import '../models/building.dart';
import '../widgets/building_card.dart';
import 'building_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // filter favorites
    List<Building> favorites =
        campusBuildings.where((b) => b.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorite buildings yet ❤️",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final building = favorites[index];

                return BuildingCard(
                  building: building,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            BuildingDetailScreen(building: building),
                      ),
                    );
                  },
                  onFavorite: () {
                    // toggle and refresh UI by popping & pushing again
                    building.isFavorite = false;
                  },
                );
              },
            ),
    );
  }
}