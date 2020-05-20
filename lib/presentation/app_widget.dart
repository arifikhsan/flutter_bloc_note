import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/presentation/home/home_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
