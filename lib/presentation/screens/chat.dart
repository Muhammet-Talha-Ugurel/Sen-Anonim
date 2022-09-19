// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/widgets/message.dart';

import '../../business_logic/bloc/message/message_bloc.dart';
import '../../business_logic/bloc/message/message_event.dart';
import '../../business_logic/bloc/message/message_state.dart';
import '../../business_logic/bloc/nav/nav_bloc.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  if (state is LoadedMessageState){
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: ListView.builder(itemCount: state.messages.length, itemBuilder: (context, index) {
                          return Message(text: state.messages[index].text, sendByMe: state.messages[index].sendByMe);}
                      
                        )),

                      ),
          Form(
              key: _formKey,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Type..",
                          prefixIcon: Icon(Icons.mail,
                              color: Color.fromARGB(255, 22, 21, 21))),                autofocus: false,
                  validator: (value) =>
                      state.isValidName ? null : 'Username is too short',
                  onChanged: (value) => context
                      .read<MessageBloc>()
                      .add(MessageTextChanged(name: value)),
                ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<MessageBloc>().add(MessageSubmitted());
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.send_rounded),
                  ),
                )
              ],
            ),
          ),
                    ],
                  );
                  }else {
                    return CircularProgressIndicator();
                  }
  }
  ));
  }
}
