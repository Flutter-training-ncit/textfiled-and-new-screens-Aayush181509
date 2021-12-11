import 'package:android_and_ios/model/new_posts.dart';
import 'package:android_and_ios/model/new_posts_videos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  String dataToBeDisplayed = "fetching Data From Server";
  List<NewVideos> newVideos = [];
  PageController pageController = PageController();

  void fetchDataFromServer() async {
    print("Starting Data fetch from server");
    final url =
        "https://pixabay.com/api/videos/?key=24747073-90cabfd95266df4486476df9e&q=yellow+flowers&pretty=true";
    try {
      final result = await Dio().get(url);
      print("This is our data from server");
      print(result.statusCode);
      print(result);
      newVideos = (result.data['hits'] as List).map<NewVideos>((item) {
        NewVideos nVideos = NewVideos.fromJson(item);
        return nVideos;
      }).toList();
      setState(() {
        dataToBeDisplayed = result.data.toString();
      });
    } catch (e) {
      print(e);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    print("this is the init function being called");
    fetchDataFromServer();
  }

  @override
  void dispose() {
    super.dispose();
    print("this is the dispose function being called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TikTok View"),
      ),
      body: newVideos.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : InkWell(
              child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: newVideos.length,
                  itemBuilder: (context, index) {
                    final _currentPost = newVideos[index];
                    return Stack(
                      children: [
                        Container(
                          child: Text(_currentPost.videoUrl),
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
