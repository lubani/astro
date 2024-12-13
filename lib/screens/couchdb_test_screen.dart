import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CouchDBTestScreen extends StatefulWidget {
  const CouchDBTestScreen({super.key});

  @override
  _CouchDBTestScreenState createState() => _CouchDBTestScreenState();
}

class _CouchDBTestScreenState extends State<CouchDBTestScreen> {
  String postResponse = '';
  List<dynamic> documents = [];

  Future<void> saveDataToCouchDB() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/save-data/');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({"name": "Jane Doe", "type": "person"});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        setState(() {
          postResponse = json.decode(response.body)['message'];
        });
      } else {
        setState(() {
          postResponse = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        postResponse = 'Error: $e';
      });
    }
  }

  Future<void> fetchDataFromCouchDB() async {
    final url = Uri.parse('http://127.0.0.1:8000/api/view-data/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          documents = json.decode(response.body)['data'];
        });
      } else {
        setState(() {
          documents = ['Error: ${response.statusCode}'];
        });
      }
    } catch (e) {
      setState(() {
        documents = ['Error: $e'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CouchDB Test'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: saveDataToCouchDB,
              child: const Text('Save Data'),
            ),
            const SizedBox(height: 10),
            Text('POST Response: $postResponse'),
            const Divider(),
            ElevatedButton(
              onPressed: fetchDataFromCouchDB,
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 10),
            const Text('GET Response:'),
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(documents[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
