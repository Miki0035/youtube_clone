// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );

Future<File> pickVideo() async {
  final file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  final video = File(file!.path);
  if (video != null) {
    return video;
  }
}

// Firebase storage doesn't work cause paid plan
Future<String> putFileInStorage(File file, int number, String fileType) async {
  final ref = FirebaseStorage.instance.ref().child("$fileType/$number");
  final uploaded = ref.putFile(file);
  final snapShot = await uploaded;
  final downloadURL = await snapShot.ref.getDownloadURL();
  return downloadURL;
}
