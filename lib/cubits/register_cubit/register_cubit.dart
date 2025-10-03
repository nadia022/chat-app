import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> register(String email, String password) async {
    emit(RegisterLoading());
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFail(errorMessage: "The password is too weak"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFail(errorMessage: "The email is already in use"));
      } else if (e.code == 'network-request-failed') {
        emit(RegisterFail(
            errorMessage: "No internet connection, please try again"));
      } else {
        print(e);
        emit(RegisterFail(errorMessage: e.message ?? "Auth error"));
      }
    } catch (e) {
      emit(RegisterFail(errorMessage: e.toString()));
    }
  }
}
