import 'package:flutter/material.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
    brightness: Brightness.dark,
  ),
      home: Wellcome(),
    );
  }
}
