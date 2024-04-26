import 'package:book_shelf1/Sell.dart';
import 'package:flutter/material.dart';
import 'package:book_shelf1/Search.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen() // Display the ToggleScreen widget
    );
  }
}
