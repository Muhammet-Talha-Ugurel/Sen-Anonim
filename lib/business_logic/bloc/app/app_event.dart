import '../../../data/models/chat.dart';

abstract class AppEvent {}

class LoadChatsEvent extends AppEvent {
  List<Chat?> chat;

  LoadChatsEvent({required this.chat});
}