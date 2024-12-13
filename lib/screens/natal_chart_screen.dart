import 'package:flutter/material.dart';

class NatalChartScreen extends StatelessWidget {
  const NatalChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final birthDateTime = args['birthDateTime'] as String;
    final city = args['city'] as String;

    final String chartUrl =
        "http://127.0.0.1:8000/api/natal-chart?birth_date=$birthDateTime&city=$city";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Natal Chart'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Image.network(
          chartUrl,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Failed to load chart.');
          },
        ),
      ),
    );
  }
}
