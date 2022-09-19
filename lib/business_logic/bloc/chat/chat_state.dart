import 'package:senanonim/data/models/chat.dart';

abstract class ChatState {}

class ChatInitial extends ChatState{}

class LoadingChatsState extends ChatState{}

class LoadedChatsState extends ChatState{
  final List<Chat?> chat;
  LoadedChatsState(this.chat);
}

class FaildToLoadChats extends ChatState{}