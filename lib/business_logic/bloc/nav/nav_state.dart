part of 'nav_bloc.dart';

@immutable
abstract class NavState {}

class HomeState extends NavState {}

class ChatScreenState extends NavState {
  final String chatId;
  ChatScreenState({required this.chatId});
}
