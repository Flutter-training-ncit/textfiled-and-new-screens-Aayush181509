import 'package:android_and_ios/model/new_posts.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  String dataToBeDisplayed = "fetching data from server";
  List<NewPosts> newPosts = [];
  PageController pageController = PageController();

  void fetchPostsDataFromServer() async {
    print("Starting Data fetch from server");
    final url =
        "https://pixabay.com/api/?key=24747073-90cabfd95266df4486476df9e&q=yellow+flowers&image_type=photo&pretty=true";
    try {
      final result = await Dio().get(url);
      print("this is out data from server");
      print(result.statusCode);
      print(result);
      newPosts = (result.data['hits'] as List).map<NewPosts>((item) {
        NewPosts nPost = NewPosts.fromJson(item);
        return nPost;
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
    print("\n This is the init function being called");
    fetchPostsDataFromServer();
  }

  @override
  void dispose() {
    super.dispose();
    print('This is the dispose function being called');
  }

  // List<Color> colors = [
  //   Colors.white,
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.pink,
  //   Colors.white,
  //   Colors.blueGrey,
  //   Colors.amber,
  //   Colors.yellow,
  // ];
  // List images = [
  //   'https://cdn.britannica.com/87/139487-050-98D3449D/Kaka-2009.jpg',
  //   'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm7Os8EzNH1bPg8aq_UizYFTKZpxidQslUCQ&usqp=CAU',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3wJZW96Op0mn0BJSXLFO15ZBDaCbNldji9A&usqp=CAU',
  //   'https://www.aljazeera.com/wp-content/uploads/2021/08/2019-12-07T000000Z_879038429_RC2LQD9L67FQ_RTRMADP_3_SOCCER-SPAIN-FCB-RCD-REPORT.jpg?resize=770%2C513',
  //   'https://i.pinimg.com/236x/aa/c8/27/aac827a17c5e7749823cc09cc8dbeec7.jpg',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newPosts.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : InkWell(
              onTap: () {
                pageController.animateToPage(3,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              },
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                //// never scrollable physics makes the list view un scrollable
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  print(index.toString());
                },
                itemCount: newPosts.length,
                itemBuilder: (context, index) {
                  final _currentPost = newPosts[index];
                  print(index.toString());
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_currentPost.newImageUrl),
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
                                _currentPost.newUserId.toString(),
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
                },

                // children: [
                //   Container(color: Colors.green),
                //   Container(color: Colors.red),
                //   Container(color: Colors.pink),
                //   Container(color: Colors.black),
                //   Container(color: Colors.white),
                // ],
              ),
            ),
    );
  }
}
