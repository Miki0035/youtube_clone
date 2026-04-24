import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/models/user_model.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/content/Long_video/parts/video.dart';
import 'package:youtube_clone/features/upload/long_video/video_model.dart';

class Post extends ConsumerWidget {
  final VideoModel video;
  const Post({super.key, required this.video});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserModel> userModel = ref.watch(
      anyUserDataProvider(video.userId),
    );
    final UserModel user = userModel.whenData((user) => user).value!;
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Video(video: video)),
          );
        },
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5vUv5dJj3OUG-pHtsNqs_098n4GrxVAI5WA&s",
              //  ?? video.thumbnail
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 5),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    // backgroundImage: CachedNetworkImageProvider(user.profilePic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    video.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * 0.1,
              ),
              child: Row(
                children: [
                  Text(
                    user.displayName,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      video.views == 0 ? "No views" : "${video.views} views",
                    ),
                  ),
                  Text("a moment ago"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
