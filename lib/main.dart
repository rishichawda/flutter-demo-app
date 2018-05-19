import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: new RandomWords(),
        ),
      ),
    );
  }
}

// class RandomWords extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//       // TODO: implement createState
      
//     }
// }

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _bigger_font = const TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    final word_pair = new WordPair.random();
    return new Text(word_pair.asPascalCase);
  }

  Widget _build_suggestions(){
    return new ListView.builder(

      padding: const EdgeInsets.all(16.0),

      itemBuilder: ( context , i ) {

        if (i.isOdd) {
          return new Divider();
        }

        final index = i ~/ 2; // Divides i by 2 and returns an integer. (Ex :- 5 ~/ 2 = 2)

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(11));

        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

}