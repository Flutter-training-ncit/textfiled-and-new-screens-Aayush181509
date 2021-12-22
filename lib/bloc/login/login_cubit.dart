import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading(loadMessage: "Checking Logging In"));
    try {
      //WE LOG IN THE USERS IN SOME WAY
      await Future.delayed(Duration(seconds: 3), () {
        emit(LoginSuccess(
            userId: email, password: password, successMessage: "Logged In"));
      });
    } catch (e, s) {
      emit(LoginError(errorMessage: s.toString()));
    } finally {
      print("THis is a finally method being called");
    }
    //we log in the users someway
  }
}
