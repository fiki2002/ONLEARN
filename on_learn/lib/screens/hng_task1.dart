import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //default joke
  String _newJokes =
      'Click the button at the bottom right corner to fetch new jokes';

  Future<void> getJokes() async {
    const baseUrl = 'https://v2.jokeapi.dev/joke/Programming?type=single';
    final headers = {"Content-type": "application/json"};
    final response = await http.get(Uri.parse(baseUrl), headers: headers);
    final responseJson = jsonDecode(response.body);
    final randomJokes = responseJson['joke'];
    setState(() {
      _newJokes = randomJokes;
    });
    debugPrint('Jokes = $randomJokes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HNG's Task 1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getJokes,
        tooltip: 'Next joke, bitte!',
        child: const Icon(
          Icons.skip_next_outlined,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello World!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'Joke: ',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.purpleAccent,
                ),
                children: [
                  TextSpan(
                    text: _newJokes,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
