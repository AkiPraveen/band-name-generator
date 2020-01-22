// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart_random_choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Band Name Generator',
      home: RandomWords(), 
    );
  }
}

// random word generator is within here
class RandomWordsState extends State<RandomWords> {
  // wordpairs
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nonsensical Band Names'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {

            

            List<String> bands = [];

            for (int i = 0; i < 10; i++) {
              var myAdj = randomChoice(adjectives);
              myAdj = myAdj[0].toUpperCase() + myAdj.substring(1);

              var myNoun = randomChoice(nouns);
              myNoun = myNoun[0].toUpperCase() + myNoun.substring(1);

              bands.add('The ' + myAdj + ' ' + myNoun + 's');
            }

            _suggestions.addAll(bands.take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String band) {
    return ListTile(
      title: Text(
        band,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
