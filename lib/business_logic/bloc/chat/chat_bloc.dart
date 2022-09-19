// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:senanonim/data/models/chat.dart';
import '../../../data/repositories/app_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

 
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _appRepository = AppRepository();
  ChatBloc()
      : super(ChatInitial()) {
    on<LoadChatsEvent>(_onLoadChatsEvent);
    _appRepository.getChats.listen((chats) async {
        final chatList = await _appRepository.chatListFromSnapshot(chats);
        add(LoadChatsEvent(chat: chatList));
    });
  }
  void _onLoadChatsEvent(LoadChatsEvent event, Emitter<ChatState> emit) async {
    try {
      emit(LoadedChatsState(event.chat));
    } catch (e) {
    }
  }
}
