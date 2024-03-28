import 'package:fedd_animals/feed_penguin.dart';
import 'package:fedd_animals/miniquizz.dart';
import 'package:fedd_animals/penguin.dart';
import 'package:fedd_animals/papa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      initialRoute: 'miniquizz',
      routes: {
        // test pages
        'feed': (context) => const CountAndFeedPage(),
        'papa': (context) => const LettersDragPagePapa(),
        'mama': (context) => const HomePage(),
        'miniquizz': (context) => const SmallQuizGame(),
      },
    );
  }
}
