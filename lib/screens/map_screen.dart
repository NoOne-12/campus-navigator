import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campus Map"),
        backgroundColor: Colors.blue,
      ),

      body: Stack(
        children: [
          //  MAP IMAGE
          SizedBox.expand(
            child: Image.asset(
              "assets/images/campus_map.jpg",
              fit: BoxFit.cover,
            ),
          ),

          //  PIN EXAMPLE
          const Positioned(
            top: 200,
            left: 150,
            child: Icon(Icons.location_on, color: Colors.red, size: 40),
          ),

          const Positioned(
            top: 300,
            left: 220,
            child: Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
  }
}