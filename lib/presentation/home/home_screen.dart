import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todos'),
      ),
      body: Center(
        child: Container(
          child: Text('Todo'),
        ),
      ),
    );
  }
}
