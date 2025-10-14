part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class chatSuccess extends ChatState {
  List<Message> messages;
  chatSuccess({required this.messages});
}
