import 'package:flutter/material.dart';
import 'package:youtube_clone/core/colors.dart';
import 'package:youtube_clone/core/widgets/image_button.dart';

class YButtons extends StatelessWidget {
  const YButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 41.0,
                  decoration: BoxDecoration(
                    color: softBlueGreyBackGround,
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Manage Videos",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ImageButton(
                  onPressed: () {},
                  image: 'pen.png',
                  haveColor: true,
                ),
              ),

              Expanded(
                child: ImageButton(
                  onPressed: () {},
                  image: 'time-watched.png',
                  haveColor: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
