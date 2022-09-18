import 'package:senanonim/data/models/chat.dart';

abstract class AppState {}

class AppInitial extends AppState{}

class LoadingChatsState extends AppState{}

class LoadedChatsState extends AppState{
  final List<Chat?> chat;
  LoadedChatsState(this.chat);
}

class FaildToLoadChats extends AppState{}