import 'package:flutter/material.dart';
import 'first_page.dart';


void main(List<String> args) {runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AnimationBasis",
      theme: ThemeData.light(),
      home: FirstPage(),
    );
  }
}