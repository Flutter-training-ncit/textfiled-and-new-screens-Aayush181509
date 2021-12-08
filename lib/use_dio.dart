import 'package:android_and_ios/widgets/post_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/posts.dart';

//

class UsingDio extends StatefulWidget {
  const UsingDio({Key? key}) : super(key: key);

  @override
  _UsingDioState createState() => _UsingDioState();
}

class _UsingDioState extends State<UsingDio> {
  String dataToBeDisplayed = "Fetching data from server";
  List<Posts> posts = [];

  void fetchPostsDataFromServer() async {
    print("starting data fetch from the server:");
    final url = "https://jsonplaceholder.typicode.com/posts/";

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);
      print(result);

      /// In dio we do not have to do json.decode() the response data.

      /// converting the list of json data that we received into the list of posts
      /// with lists's map function

      posts = (result.data as List).map<Posts>((item) {
        Posts newPost = Posts.fromJson(item);
        return newPost;
      }).toList();

      setState(() {
        dataToBeDisplayed = result.data.toString();
      });
    } catch (e) {
      print(e);
      setState(() {});
    }

    ///
    // Dio().get(url).then((res) {
    //   print(res);
    // }).catchError((e) {
    //   print(e);
    // });

    ///
  }

  @override
  void initState() {
    super.initState();

    print("\n This is the init state functionn being called \n");

    fetchPostsDataFromServer();

    if (mounted) {}
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // @override
  // void didUpdateWidget(covariant UsingDio oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    super.dispose();
    print("this is the dispose function being called");
  }

  @override
  Widget build(BuildContext context) {
    print("\n This is the build  functionn being called \n");

    return Scaffold(
      appBar: AppBar(
        title: Text("Use dio"),
      ),
      body: posts.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final _currentPost = posts[index];

                print(index.toString());

                return PostWidget(post: _currentPost);
              },
            ),
    );
  }
}
