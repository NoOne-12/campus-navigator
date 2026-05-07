import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Project"),
        centerTitle: true,
      ),

      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Campus Navigator App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "This project is a Campus Navigator application developed to help students easily locate and explore buildings within the campus.",
            ),

            SizedBox(height: 20),

            Text(
              "Group Members:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("- Naol Gelana             UGR/35081/16"),
            Text("- Ibsa Magarsa            UGR/34652/16"),
            Text("- abdulletif Ylkal        UGR/35974/16"),
            Text("- Firaol Ararso           UGR/34431/16"),
            Text("- Wogari Ararsa           UGR/35558/16"),
            Text("- Dagim Girma             UGR/34169/16"),
          ],
        ),
      ),
    );
  }
}