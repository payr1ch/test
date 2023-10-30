import 'package:flutter/material.dart';
import 'package:test_app/presentation/screen/home_page.dart';
import 'package:test_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeColors.backgroundColor,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
