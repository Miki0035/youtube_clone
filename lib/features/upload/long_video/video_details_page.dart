import 'package:flutter/material.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter the title'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
