import 'package:android_and_ios/model/posts.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.post}) : super(key: key);

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),

          /// to decorate the container
          decoration: BoxDecoration(
            /// give the color to the container
            color: Colors.white,

            /// making the container rounded
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(10, 10))
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Text(post.body),
              // Image.asset("assets/images/solo.jpeg"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.send,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.thumbs_up_down,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.comment),
                      ],
                    ),
                    Icon(Icons.share)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
