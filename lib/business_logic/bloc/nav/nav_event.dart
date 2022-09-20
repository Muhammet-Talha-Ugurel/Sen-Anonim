part of 'nav_bloc.dart';

@immutable
abstract class NavEvent {}
class HomeScreenEvent extends NavEvent{}

class ChatScreenEvent extends NavEvent{
  final String chatId;
  ChatScreenEvent({required this.chatId});
}