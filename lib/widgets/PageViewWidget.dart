import 'package:android_and_ios/model/new_posts.dart';
import 'package:flutter/material.dart';

class TikTokVideo extends StatelessWidget {
  TikTokVideo({Key? key, required this.newPosts}) : super(key: key);
  final NewPosts newPosts;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(newPosts.newImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(height: 20),
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.comment,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.share,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 60,
                ),
                Icon(Icons.circle),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  newPosts.newUserId.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // children: [
  //   Container(color: Colors.green),
  //   Container(color: Colors.red),
  //   Container(color: Colors.pink),
  //   Container(color: Colors.black),
  //   Container(color: Colors.white),
  // ],
}
