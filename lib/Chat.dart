// ignore_for_file: library_private_types_in_public_api, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'Groupes.dart';
import 'chatlist.dart';

var test333 = [];
var messagestest1 = [];
var number = 2;

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.mode, required this.index})
      : super(key: key);
  final int mode;
  final int index;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    bool isMobile(context) => MediaQuery.of(context).size.width < 680;
    if (widget.mode == 0) {
      if (isMobile(context)) {
        return Container(
          color: Colors.white,
          width: 310,
          child: const Groupes(),
        );
      } else {
        return Row(
          children: [
            Container(
              color: Colors.white,
              width: 310,
              child: const Groupes(),
            ),
            Expanded(child: ChatList(index: widget.index,))
          ],
        );
      }
    } else {
      if (isMobile(context)) {
        return ChatList(index: widget.index,);
      } else {
        return Row(
          children: [
            Container(
              color: Colors.white,
              width: 310,
              child: const Groupes(),
            ),
            Expanded(
              child: ChatList(index: widget.index,)
            )
          ],
        );
      }
    }
  }
}
