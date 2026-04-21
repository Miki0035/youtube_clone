import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:youtube_clone/core/methods.dart';
import 'package:youtube_clone/features/upload/long_video/video_repository.dart';

class VideoDetailsPage extends ConsumerStatefulWidget {
  final File video;
  const VideoDetailsPage({super.key, required this.video});

  @override
  ConsumerState<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends ConsumerState<VideoDetailsPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isThumbnailSelected = false;
  String randomId = const Uuid().v4();
  String randomVideoId = const Uuid().v4();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter the title",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 5),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter the title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Text(
                "Add a description",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 5),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter the Description',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),

              // select thumbnail
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // pick image
                      image = await pickImage();
                      isThumbnailSelected = true;
                      setState(() {});
                    },
                    child: Text(
                      'Select thumbnail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              isThumbnailSelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Image.file(
                        image!,
                        cacheHeight: 160,
                        cacheWidth: 400,
                      ),
                    )
                  : SizedBox.shrink(),

              isThumbnailSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            // upload image to storage
                            String thumbnail = await putFileInStorage(
                              image!,
                              randomId,
                              'image',
                            );

                            // upload video to storage
                            String videoUrl = await putFileInStorage(
                              widget.video,
                              randomId,
                              'video',
                            );

                            ref
                                .watch(longVideoProvider)
                                .uploadVideoToFirestore(
                                  videoUrl: videoUrl,
                                  thumbnail: thumbnail,
                                  title: titleController.text.trim(),
                                  videoId: randomVideoId,
                                  datePublished: DateTime.now(),
                                  userId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                );
                          },
                          child: Text(
                            'Publish',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
