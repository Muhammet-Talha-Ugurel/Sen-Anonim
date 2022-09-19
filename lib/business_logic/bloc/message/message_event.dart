import '../../../data/models/message.dart';

abstract class MessageEvent {}

class LoadMessagesEvent extends MessageEvent {
  final List<Message> messages;
  LoadMessagesEvent({required this.messages});
}

class MessageSubmitted extends MessageEvent {}

class MessageTextChanged extends MessageEvent {
  final String name;

  MessageTextChanged({required this.name});
}