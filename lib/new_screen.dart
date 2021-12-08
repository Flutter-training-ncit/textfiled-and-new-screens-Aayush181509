import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    print(_height);
    print(_width);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Details Screen"),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/solo.jpeg",
            height: _height,
            fit: BoxFit.cover,
          ),
          // Container(color: Colors.green.withOpacity(0.5)),
          Container(color: Colors.black.withOpacity(0.1)),
          Positioned(
            right: 20,
            bottom: 30,
            child: Text(
              "Credits: Mr Photographer",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "This is center text",
          //     style: TextStyle(color: Colors.white, fontSize: 20),
          //   ),
          // ),
        ],
      ),
    );
  }
}
