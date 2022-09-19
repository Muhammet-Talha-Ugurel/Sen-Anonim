import '../../../data/models/chat.dart';

abstract class ChatEvent {}

class LoadChatsEvent extends ChatEvent {
  List<Chat?> chat;

  LoadChatsEvent({required this.chat});
}