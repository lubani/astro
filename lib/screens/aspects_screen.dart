// aspects_screen.dart
import 'package:flutter/material.dart';

class AspectsScreen extends StatelessWidget {
  const AspectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example static data; integrate CouchDB fetch calls as needed
    final aspects = [
      {
        "title": "Sun Trine Saturn",
        "meaning": "Discipline, structure, and confidence in personal identity."
      },
      {
        "title": "Venus in Taurus",
        "meaning":
            "Stable, sensual, and comfort-loving approach to relationships and aesthetics."
      },
      {
        "title": "Mars Square Pluto",
        "meaning": "Intense drives, confrontations, and transformative energy."
      },
      // Add more aspects or planet-sign combos as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspects & Planet Sign Meanings'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: aspects.length,
        itemBuilder: (context, index) {
          final aspect = aspects[index];
          return ListTile(
            title: Text(aspect["title"]!),
            subtitle: Text(aspect["meaning"]!),
          );
        },
      ),
    );
  }
}
