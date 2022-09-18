// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:senanonim/data/models/chat.dart';
import '../../../data/repositories/app_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

 
class AppBloc extends Bloc<AppEvent, AppState> {
  final _appRepository = AppRepository();
  AppBloc()
      : super(AppInitial()) {
    on<LoadChatsEvent>(_onLoadChatsEvent);
    _appRepository.getChats.listen((chats) async {
        final chatList = await _appRepository.chatListFromSnapshot(chats);
        add(LoadChatsEvent(chat: chatList));
    });
  }
  void _onLoadChatsEvent(LoadChatsEvent event, Emitter<AppState> emit) async {
    try {
      emit(LoadedChatsState(event.chat));
    } catch (e) {
    }
  }
}
