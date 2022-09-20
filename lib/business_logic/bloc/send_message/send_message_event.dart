import '../../../data/models/message.dart';

abstract class SendMessageEvent {}

class SendMessageSubmitted extends SendMessageEvent {}

class SendMessageTextChanged extends SendMessageEvent {
  final String name;

  SendMessageTextChanged({required this.name});
}