import 'package:android_and_ios/model/new_posts.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'posts_state.dart';

class PostBloc extends Cubit<PostState> {
  PostBloc() : super(PostInitial());
  PageController pageController = PageController();

  getPostsFromServer() async {
    print('hi');
    emit(PostsLoadingState(loadMessage: 'Loading'));
    final url =
        "https://pixabay.com/api/?key=24747073-90cabfd95266df4486476df9e&q=yellow+flowers&image_type=photo&pretty=true";
    try {
      final result = await Dio().get(url);
      print("This is our data from server");
      print(result.statusCode);
      var newPosts = (result.data['hits'] as List).map<NewPosts>((item) {
        NewPosts nPost = NewPosts.fromJson(item);
        return nPost;
      }).toList();
      if (newPosts.isEmpty) {
        emit(ErrorState(errorMessage: "Sorry The post is empty"));
      } else {
        emit(PostSuccessState(data: newPosts));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
