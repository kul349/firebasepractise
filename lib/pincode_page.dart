import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practiceproject/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YourApp(),
  ));
}
