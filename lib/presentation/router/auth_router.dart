import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/router/app_router.dart';
import 'package:senanonim/presentation/screens/home.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

import '../../business_logic/bloc/chat/chat_bloc.dart';
import '../../business_logic/bloc/auth/auth_bloc.dart';
import '../../business_logic/bloc/auth/auth_event.dart';
import '../../business_logic/bloc/auth/auth_state.dart';

class AuthFlowNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AutoLoginEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state is UnauthentiactedState)
                MaterialPage(
                    child: BlocProvider(
                  create: (context) => ChatBloc(),
                  child: Wellcome(),
                ))
              else if (state is AuthenticatedState)
                MaterialPage(
                    child: BlocProvider(
                  create: (context) => ChatBloc(),
                  child: AppNavigator(),
                ))
                else
                MaterialPage(
                    child: BlocProvider(
                  create: (context) => ChatBloc(),
                  child: Scaffold(body: Center(child: CircularProgressIndicator(),)),
                ))
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        },
      ),
    );
  }
}
