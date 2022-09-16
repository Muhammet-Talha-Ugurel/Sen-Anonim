// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/screens/home.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

import '../../business_logic/bloc/auth/auth_bloc.dart';
import '../../business_logic/bloc/auth/auth_state.dart';

class AuthFlowNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
            if (state is UnauthentiactedState)
              MaterialPage(child: Wellcome())
              
            else if (state is AuthenticatedState)
              MaterialPage(child: HomeScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}