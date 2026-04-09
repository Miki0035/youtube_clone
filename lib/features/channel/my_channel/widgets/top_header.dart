import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/models/user_model.dart';

class TopHeader extends StatelessWidget {
  final UserModel user;
  const TopHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 34.0,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.profilePic),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 4.0),
          child: Text(
            user.displayName,
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 9.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.blueGrey),
              children: [
                TextSpan(text: "@${user.userName} "),
                TextSpan(text: "${user.subscriptions.length} subsriptions "),
                TextSpan(text: "${user.videos} videos"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
