// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:senanonim/data/repositories/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = AuthRepository();
  AuthBloc()
      : super(UnauthentiactedState()) {
    on<AutoLoginEvent>(_onAutoLoginEvent);
    on<CreateAcountEvent>(_onCreateAcountEvent);
  }
  Future<void> _onAutoLoginEvent(AutoLoginEvent event, Emitter<AuthState> emit) async {
    emit(UnauthentiactedState());
    final result  = await _authRepository.attemptAutoLogin();
    if(result!){
      emit(AuthenticatedState());
    }else{
    emit(UnauthentiactedState());
    }
  }

  void _onCreateAcountEvent(CreateAcountEvent event, Emitter<AuthState> emit){
    emit(CreatingAcountState());
    try{
      _authRepository.createAcount();
      emit(AuthenticatedState());
    }catch (e){
      emit(FailedToCreateAcountState(error: e as Error));
    }
  }
}
