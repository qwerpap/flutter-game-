import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterGame());
}

class FlutterGame extends StatelessWidget {
  const FlutterGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('06.02-21:00'),
    );
  }
}