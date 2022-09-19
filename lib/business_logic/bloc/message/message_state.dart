
import '../../../data/models/message.dart';
import '../../form_submition_status.dart';

class MessageState {
  final String name;
  bool get isValidName => name.isEmpty;

  final FormSubmissionStatus formStatus;

  MessageState({
    this.name = '',
    this.formStatus = const InitialFormStatus(),
  });

  MessageState copyWith({
    String? name,
    FormSubmissionStatus? formStatus,
  }) {
    return MessageState(
      name: name ?? this.name,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoadingMessagesState extends MessageState {}

class LoadedMessageState extends MessageState {
  final List<Message> messages;
  LoadedMessageState(this.messages);
}

class FaildToLoadMessageState extends MessageState {
  Error error;
  FaildToLoadMessageState({required this.error});
}
