import 'package:flutter/material.dart';
import '../models/building.dart';

class BuildingCard extends StatelessWidget {
  final Building building;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const BuildingCard({
    super.key,
    required this.building,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            building.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            building.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        subtitle: Text(
          building.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: IconButton(
          icon: Icon(
            building.isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            color: building.isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavorite,
        ),

        onTap: onTap,
      ),
    );
  }
}