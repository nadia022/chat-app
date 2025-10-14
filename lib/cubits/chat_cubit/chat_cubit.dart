import 'package:bloc/bloc.dart';
import 'package:chat_app/firebase/firebase_utils.dart';
import 'package:chat_app/model/message.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  void sendMessage(String message, String email) {
    try {
      FirebaseUtils.addMessage(Message(message: message, email: email));
    } catch (e) {
      print("Failed");
    }
  }

  void getMessages() {
    FirebaseUtils.getMessage().listen((event) {
      List<Message> messages = [];
      for (var doc in event.docs) {
        messages.add(doc.data());
      }
      emit(chatSuccess(messages: messages));
    });
  }
}
