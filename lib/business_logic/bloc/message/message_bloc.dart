import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/app_repository.dart';
import '../../form_submition_status.dart';
import 'message_event.dart';
import 'message_state.dart';


class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final String chatId;
  final _appRepository = AppRepository();
  MessageBloc(this.chatId) : super(LoadingMessagesState()) {
    on<LoadMessagesEvent>(_onLoadMessagesEvent);
    _appRepository.getMessages(chatId).listen((messages) async{
      add(LoadMessagesEvent(messages: messages));
    });
  }
  void _onLoadMessagesEvent(LoadMessagesEvent event, Emitter<MessageState> emit){
    emit(LoadedMessageState(event.messages));

  }
}
