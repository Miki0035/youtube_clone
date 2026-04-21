import 'package:flutter/material.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key});

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
                    onPressed: () {},
                    child: Text(
                      'Select thumbnail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
