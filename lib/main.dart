import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final word_pair = new WordPair.random();

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text('Welcome to Flutter'),
          ) 
        ),
        body: new Center(
          // child: new Text('Hello World'),
          child: new Text(word_pair.asPascalCase),
        ),
      ),
    );
  }
}