import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/core/widgets/flat_button.dart';
import 'package:youtube_clone/features/auth/repository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UserPage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;
  const UserPage({
    super.key,
    required this.displayName,
    required this.profilePic,
    required this.email,
  });

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  final TextEditingController userNameController = TextEditingController();
  bool isValidate = true;

  void validateUserName() async {
    final userMap = await FirebaseFirestore.instance.collection("users").get();

    final userList = userMap.docs.map((user) => user).toList();
    String? targetUserName;

    for (var user in userList) {
      if (userNameController.text == user.data()["username"]) {
        targetUserName = user.data()["username"];
        isValidate = false;
        setState(() {});
      }
      if (userNameController.text != targetUserName) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 14.0),
              child: Text(
                "Enter username ",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Form(
                key: formKey,
                child: TextFormField(
                  onChanged: (value) {
                    validateUserName();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    return isValidate ? null : "username is already taken";
                  },
                  controller: userNameController,
                  decoration: InputDecoration(
                    suffixIcon: isValidate
                        ? Icon(Icons.verified_user_rounded)
                        : Icon(Icons.cancel),
                    suffixIconColor: isValidate ? Colors.green : Colors.red,
                    hintText: "Insert user name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
                left: 8.0,
                right: 8.0,
              ),
              child: FlatButton(
                text: 'Continue',
                onPressed: () async {
                  isValidate
                      ? await ref
                            .read(userDataServiceProvider)
                            .addUserDataToFirestore(
                              displayName: widget.displayName,
                              userName: userNameController.text,
                              email: widget.email,
                              description: "",
                              profilePic: widget.profilePic,
                            )
                      : null;
                },
                colour: isValidate ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
