import 'package:flutter/material.dart';
import 'Home.dart'; // Assuming Home.dart contains your HomePage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        // Define your app's theme
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // This should point to your home screen widget
    );
  }
}

