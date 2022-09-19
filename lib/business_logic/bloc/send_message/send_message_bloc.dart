import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/app_repository.dart';
import '../../form_submition_status.dart';
import 'send_message_event.dart';
import 'send_message_state.dart';


class MessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final String chatId;
  final _appRepository = AppRepository();
  MessageBloc(this.chatId) : super(SendMEssagesInitialState()) {
    on<MessageTextChanged>(_onMessageTextChanged);
    on<MessageSubmitted>(_onMessageSubmitted);
  }
  void _onMessageTextChanged(MessageTextChanged event, Emitter<SendMessageState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onMessageSubmitted(MessageSubmitted event, Emitter<SendMessageState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      final user = _appRepository.getUser();
      _appRepository.sendMessage(chatId, state.name);
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }
}
