// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/bloc/app/app_bloc.dart';
import '../../business_logic/bloc/app/app_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  if(state is LoadingChatsState){
                    return Center(child: CircularProgressIndicator(),);
                  }else if (state is LoadedChatsState){
                  return ListView.builder(itemCount: state.chat.length, itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width / 5,
                      child: Card(
                        child: Center(
                          child: Text(
                            state.chat[index]!.Name,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                  } );
                  }else {
                    return CircularProgressIndicator();
                  }
                },
      ),
    );
  }
}
