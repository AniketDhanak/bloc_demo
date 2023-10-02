import 'package:bloc_demo_api/constants/route_constants.dart';
import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget {
  final String title;
  const LastScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Last Screen"),
      ),
      body: Center(
        child: Text(
         title.toString(),
         style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}
