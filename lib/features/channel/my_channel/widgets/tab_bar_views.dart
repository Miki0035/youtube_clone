import 'package:flutter/material.dart';

class YTabViews extends StatelessWidget {
  const YTabViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          Center(child: Text("Home")),
          Center(child: Text("Videos")),
          Center(child: Text("Shorts")),
          Center(child: Text("Community")),
          Center(child: Text("Playlists")),
          Center(child: Text("Channels")),
          Center(child: Text("About")),
        ],
      ),
    );
  }
}
