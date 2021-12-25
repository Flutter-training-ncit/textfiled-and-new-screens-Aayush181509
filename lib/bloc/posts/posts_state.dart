import 'package:android_and_ios/model/new_posts.dart';
import 'package:android_and_ios/new_screen.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostsLoadingState extends PostState {
  final String loadMessage;
  PostsLoadingState({required this.loadMessage});
  List<Object> get props => [loadMessage];
}

class ErrorState extends PostState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
  List<Object> get props => [errorMessage];
}

class PostSuccessState extends PostState {
  final List<NewPosts> data;
  final String? successMessage;
  PostSuccessState({required this.data, this.successMessage});

  List<Object> get props => [data];
}


//loading state when the videos are being fetched from the server
//error state
//videos fetched successfully