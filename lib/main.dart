import 'package:flutter/material.dart';
import 'package:practiceproject/pages/map_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Map",
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: GoogleMapScreen(),
  ));
}
