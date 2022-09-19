import '../../../data/models/message.dart';

abstract class SendMessageEvent {}

class MessageSubmitted extends SendMessageEvent {}

class MessageTextChanged extends SendMessageEvent {
  final String name;

  MessageTextChanged({required this.name});
}