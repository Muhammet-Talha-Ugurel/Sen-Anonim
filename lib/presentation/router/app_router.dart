// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/screens/chat.dart';
import 'package:senanonim/presentation/screens/home.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

import '../../business_logic/bloc/chat/chat_bloc.dart';
import '../../business_logic/bloc/chat/chat_event.dart';
import '../../business_logic/bloc/auth/auth_bloc.dart';
import '../../business_logic/bloc/auth/auth_event.dart';
import '../../business_logic/bloc/message/message_bloc.dart';
import '../../business_logic/bloc/nav/nav_bloc.dart';

class AppNavigator extends StatelessWidget {
  final NavBloc _navBloc = NavBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _navBloc,
      child: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state is HomeState)
                MaterialPage(
                    child: BlocProvider(
                  create: (context) => ChatBloc(),
                  child: BlocProvider.value(
                    value: _navBloc,
                    child: HomeScreen(),
                  ),
                ))
              else if (state is ChatScreenState)
                MaterialPage(
                  child: BlocProvider.value(
                    value: _navBloc,
                    child: BlocProvider(
                      create: (context) => MessageBloc(state.chatId),
                      child: ChatScreen(),
                    ),
                  ),
                )
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        },
      ),
    );
  }
}
