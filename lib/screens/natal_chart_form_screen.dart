import 'package:flutter/material.dart';

class NatalChartFormScreen extends StatefulWidget {
  const NatalChartFormScreen({super.key});

  @override
  _NatalChartFormScreenState createState() => _NatalChartFormScreenState();
}

class _NatalChartFormScreenState extends State<NatalChartFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _hourController = TextEditingController();
  final _cityController = TextEditingController(); // Add this line

  @override
  void dispose() {
    _dateController.dispose();
    _hourController.dispose();
    _cityController.dispose(); // Dispose city controller
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String date = _dateController.text.trim();
      String hour = _hourController.text.trim();
      String city = _cityController.text.trim();

      String birthDateTime = "${date}T$hour";

      // Navigate and pass parameters or construct the URL directly here
      Navigator.pushNamed(
        context,
        '/natal-chart',
        arguments: {
          'birthDateTime': birthDateTime,
          'city': city,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Natal Chart Form'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth (YYYY-MM-DD)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid date.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hourController,
                decoration: const InputDecoration(
                  labelText: 'Hour of Birth (HH:MM:SS)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid time.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Add city field
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City of Birth',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a city name.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Show Natal Chart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
