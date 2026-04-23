// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_clone/features/upload/long_video/video_details_page.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );

// pick video
Future<void> pickVideo(BuildContext context) async {
  final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  if (file == null) return;

  final video = File(file.path);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => VideoDetailsPage(video: video)),
  );
}

// pick image
Future<File> pickImage() async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  final image = File(file!.path);
  if (image != null) {
    return image;
  }
}

// Firebase storage doesn't work cause paid plan
Future<String> putFileInStorage(
  File file,
  String number,
  String fileType,
) async {
  final ref = FirebaseStorage.instance.ref().child("$fileType/$number");
  final uploaded = ref.putFile(file);
  final snapShot = await uploaded;
  final downloadURL = await snapShot.ref.getDownloadURL();
  return downloadURL;
}
