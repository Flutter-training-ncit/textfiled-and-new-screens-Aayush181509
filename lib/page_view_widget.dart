import 'package:android_and_ios/bloc/posts/posts_bloc.dart';
import 'package:android_and_ios/model/new_posts.dart';
import 'package:android_and_ios/widgets/PageViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:android_and_ios/bloc/posts/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  String dataToBeDisplayed = "fetching data from server";
  // List<NewPosts> newPosts = [];
  PageController pageController = PageController();

  // void fetchPostsDataFromServer() async {
  //   print("Starting Data fetch from server");
  //   final url =
  //       "https://pixabay.com/api/?key=24747073-90cabfd95266df4486476df9e&q=yellow+flowers&image_type=photo&pretty=true";
  //   try {
  //     final result = await Dio().get(url);
  //     print("this is out data from server");
  //     print(result.statusCode);
  //     print(result);
  //     newPosts = (result.data['hits'] as List).map<NewPosts>((item) {
  //       NewPosts nPost = NewPosts.fromJson(item);
  //       return nPost;
  //     }).toList();

  //     setState(() {
  //       dataToBeDisplayed = result.data.toString();
  //     });
  //   } catch (e) {
  //     print(e);
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    super.initState();
    print("\n This is the init function being calledddd");
    context.read<PostBloc>().getPostsFromServer();
    // fetchPostsDataFromServer();
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
      appBar: AppBar(
        title: Text('MY NEW PAGE'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          setState(() {});
        },
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is ErrorState) {
            return Text(state.errorMessage);
          }
          if (state is PostSuccessState) {
            return PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                //// never scrollable physics makes the list view un scrollable
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  print(index.toString());
                },
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final _currentPost = state.data[index];
                  print(index.toString());
                  return TikTokVideo(newPosts: _currentPost);
                });
          }
          return Container();
        },
      ),
    );
  }
}
