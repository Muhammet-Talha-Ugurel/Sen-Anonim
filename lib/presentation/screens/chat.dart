// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senanonim/presentation/widgets/message.dart';

import '../../business_logic/bloc/message/message_bloc.dart';
import '../../business_logic/bloc/message/message_event.dart';
import '../../business_logic/bloc/message/message_state.dart';
import '../../business_logic/bloc/nav/nav_bloc.dart';
import '../../business_logic/bloc/send_message/send_message_bloc.dart';
import '../../business_logic/bloc/send_message/send_message_event.dart';
import '../../business_logic/bloc/send_message/send_message_state.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
          color: Colors.black,
          onPressed: () {
                        context.read<NavBloc>()
                          ..add(HomeScreenEvent());
          },
        ),
        ),
        body: BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
          if (state is LoadedMessageState) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                      child: ListView.builder(
                        reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              
                              child: Message(
                                  text: state.messages[index].text,
                                  sendByMe: state.messages[index].sendByMe),
                            );
                          })),
                ),
                BlocBuilder<SendMessageBloc,SendMessageState>(
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _textController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Type..",
                                  prefixIcon: Icon(Icons.mail,
                                      color: Color.fromARGB(255, 22, 21, 21))),
                              autofocus: false,
                              validator: (value) => state.isValidName
                                  ? null
                                  : 'Username is too short',
                              onChanged: (value) => context
                                  .read<SendMessageBloc>()
                                  .add(SendMessageTextChanged(name: value)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<SendMessageBloc>()
                                    .add(SendMessageSubmitted());
                                                        _textController.clear();

                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.send_rounded),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
        )
      );
  }
}
