// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';
 
class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc() : super(Unauthenticated()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
