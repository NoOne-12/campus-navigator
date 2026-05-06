import 'package:flutter/material.dart';
import '../models/building.dart';

class BuildingDetailScreen extends StatefulWidget {
  final Building building;

  const BuildingDetailScreen({
    super.key,
    required this.building,
  });

  @override
  State<BuildingDetailScreen> createState() =>
      _BuildingDetailScreenState();
}

class _BuildingDetailScreenState extends State<BuildingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final building = widget.building;

    return Scaffold(
      appBar: AppBar(
        title: Text(building.name),
        actions: [
          IconButton(
            icon: Icon(
              building.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                building.isFavorite = !building.isFavorite;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ IMAGE (WITH HERO ANIMATION)
            Hero(
              tag: building.name,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  building.image,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 📄 CONTENT
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷️ TITLE
                  Text(
                    building.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 📘 DESCRIPTION
                  Text(
                    building.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 📍 LOCATION TITLE
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 6),
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 📍 LOCATION TEXT
                  Text(
                    building.location,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}