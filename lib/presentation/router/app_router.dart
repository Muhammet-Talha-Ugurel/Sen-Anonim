// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/screens/home.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

import '../../business_logic/bloc/app/app_bloc.dart';
import '../../business_logic/bloc/app/app_event.dart';
import '../../business_logic/bloc/auth/auth_bloc.dart';
import '../../business_logic/bloc/auth/auth_event.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
            child: BlocProvider(
          create: (context) => AppBloc(),
          child: HomeScreen(),
        ))
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
