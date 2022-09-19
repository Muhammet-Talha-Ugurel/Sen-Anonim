import '../../form_submition_status.dart';

class SendMessageState {
  final String name;
  bool get isValidName => name.isEmpty;

  final FormSubmissionStatus formStatus;

  SendMessageState({
    this.name = '',
    this.formStatus = const InitialFormStatus(),
  });

  SendMessageState copyWith({
    String? name,
    FormSubmissionStatus? formStatus,
  }) {
    return SendMessageState(
      name: name ?? this.name,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
class SendMEssagesInitialState extends SendMessageState {}