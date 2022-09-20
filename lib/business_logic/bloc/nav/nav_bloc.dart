import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(HomeScreenState()) {
    on<HomeScreenEvent>(_onHomeScreenEvent);
    on<ChatScreenEvent>(_onChatScreenEvent);
  }
  void _onHomeScreenEvent(HomeScreenEvent event, Emitter<NavState> emit){
    emit(HomeScreenState());
  }

  void _onChatScreenEvent(ChatScreenEvent event, Emitter<NavState> emit){
    emit(ChatScreenState(chatId: event.chatId));
  }

}
