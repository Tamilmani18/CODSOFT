import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quote_of_the_day/pages/widgets/quote_widget.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apiURL = "https://type.fit/api/quotes";

  Future<List<dynamic>> getPost() async {
    final uri = Uri.parse(apiURL);
    final response = await http.get(uri);
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = json.decode(str);
    jsonData.shuffle();
    return jsonData;
  }

  final Random _random = Random();

  Color getRandomColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError || snapshot.data == null) {
              return ErrorWidget(snapshot.error ?? 'An error occurred');
            }
            return PageView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var model = snapshot.data?[index];
                return QuoteWidget(
                  quote: model["text"].toString(),
                  author: model["author"].toString(),
                  backgroundcolor: getRandomColor(),
                  onShareClick: () {
                    _shareQuote(
                        model["text"].toString(), model["author"].toString());
                  },
                  onLikeClick: () {
                    _likeQuote(model["text"].toString());
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

void _shareQuote(String text, String author) {
  print("Shared: $text\n\n- $author");
}

void _likeQuote(String text) {
  print("Liked: $text");
}
