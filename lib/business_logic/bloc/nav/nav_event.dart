part of 'nav_bloc.dart';

@immutable
abstract class NavEvent {}

class ChatScreenEvent extends NavEvent{
  final String chatId;
  ChatScreenEvent({required this.chatId});
}