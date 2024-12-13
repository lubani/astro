import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/natal_chart_screen.dart';
import 'screens/natal_chart_form_screen.dart';
import 'screens/aspects_screen.dart'; // Import the new screen

void main() {
  runApp(const AstrologyApp());
}

class AstrologyApp extends StatelessWidget {
  const AstrologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrology App',
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/natal-chart': (context) => const NatalChartScreen(),
        '/natal-chart-form': (context) => const NatalChartFormScreen(),
        '/aspects': (context) => const AspectsScreen(), // New route
      },
    );
  }
}
