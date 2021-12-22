part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  String loadMessage;
  LoginLoading({required this.loadMessage});
  List<Object> get props => [loadMessage];
}

class LoginSuccess extends LoginState {
  String userId;
  String password;
  String successMessage;
  LoginSuccess(
      {required this.userId,
      required this.password,
      required this.successMessage});
  List<Object> get props => [userId, password, successMessage];
}

class LoginError extends LoginState {
  String errorMessage;
  LoginError({required this.errorMessage});
  List<Object> get props => [errorMessage];
}
