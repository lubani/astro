import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  String horoscope = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchHoroscope();
  }

  Future<void> fetchHoroscope() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/horoscope/'));
    if (response.statusCode == 200) {
      setState(() {
        horoscope = response.body;
      });
    } else {
      setState(() {
        horoscope = 'Failed to load horoscope!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horoscope'),
      ),
      body: Center(
        child: Text(
          horoscope,
          style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
