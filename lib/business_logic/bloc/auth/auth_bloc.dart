// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:senanonim/data/repositories/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(UnauthentiactedState()) {
    on<CreateAcountEvent>(_onCreateAcountEvent);
    on<AutoLoginEvent>(_onAutoLoginEvent);
  }
  void _onCreateAcountEvent(CreateAcountEvent event, Emitter<AuthState> emit){
    emit(AuthenticatedState());
  }
  void _onAutoLoginEvent(AutoLoginEvent event, Emitter<AuthState> emit){
    emit(AuthenticatedState());
  }
}
