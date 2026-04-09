import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/models/user_model.dart';

final userDataServiceProvider = Provider(
  (ref) => UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({required this.auth, required this.firestore});

  Future<void> addUserDataToFirestore({
    required String displayName,
    required String userName,
    required String email,
    required String description,
    required String profilePic,
  }) async {
    UserModel user = UserModel(
      userId: auth.currentUser!.uid,
      displayName: displayName,
      userName: userName,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      description: description,
      type: 'user',
    );

    await firestore.collection("users").doc(user.userId).set(user.toJson());
  }

  // Fetch data from firestore
  Future<UserModel> fetchCurrentUserData() async {
    final currentUserMap = await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get();
    return UserModel.fromJson(currentUserMap.data()!);
  }
}
