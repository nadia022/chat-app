import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // hold data , handle logic

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginFail(errorMessage: "The password is too weak"));
      } else if (e.code == 'email-already-in-use') {
        emit(LoginFail(errorMessage: "The email is already in use"));
      } else if (e.code == 'network-request-failed') {
        emit(LoginFail(
            errorMessage: "No internet connection, please try again"));
      } else {
        print(e);
        emit(LoginFail(errorMessage: e.message ?? "Auth error"));
      }
    } catch (e) {
      emit(LoginFail(errorMessage: e.toString()));
    }
  }
}
