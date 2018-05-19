import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords()
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

class RandomWordsState extends State < RandomWords > {

    final _suggestions = < WordPair > [];
    final _bigger_font =
    const TextStyle(fontSize: 16.0);

    final _saved = new Set < WordPair > ();

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text('Name Pair Generator')
          ),
        ),
        body: _build_suggestions(),
      );
    }

    Widget _build_suggestions() {
      return new ListView.builder(

        padding: const EdgeInsets.all(16.0),

          itemBuilder: (context, i) {

            if (i.isOdd) {
              return new Divider();
            }

            final index = i ~/ 2; // Divides i by 2 and returns an integer.(Ex: -5~/ 2 = 2)

              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(11));

              }

              return _build_row(_suggestions[index]);
            }
          );
      }

      Widget _build_row(WordPair word_pair) {

        final already_saved = _saved.contains(word_pair);

        return new ListTile(
          title: new Text(
            word_pair.asPascalCase,
            style: _bigger_font,
          ),
          trailing: new Icon(
            already_saved ? Icons.favorite : Icons.favorite_border,
            color: already_saved ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              if (already_saved) {
                _saved.remove(word_pair);
              } else {
                _saved.add(word_pair);
              }
            });
          },
        );

      }

    }