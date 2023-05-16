// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

var messages = [];

var userid = [];

var number = 1;

var numberapp = 2;

var send = "";

var windex = 1;

var id = "";

var useridjson = {};

class ChatList extends StatefulWidget {
  const ChatList({Key? key, required this.index, this.message, this.number})
      : super(key: key);
  final int index;
  final message;
  final number;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textFieldController = TextEditingController();
  asyncapp() {}
  User? user = FirebaseAuth.instance.currentUser;
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    FirebaseDatabase.instance
        .ref("message/groupes/${widget.index}/messages")
        .onValue
        .listen((event) async {
      print(event.snapshot.value);
      setMessage(event.snapshot);

      //getmessage();
    });
    FirebaseDatabase.instance.ref("username").onValue.listen((event) async {
      print(event.snapshot.value);
      if (event.snapshot.value is Map) {
        Map<dynamic, dynamic> data = event.snapshot.value as Map;
        data.forEach((key, value) {
          print(key);
          print(value);
          useridjson.addAll({key: value});
        });
        print(useridjson);
      }
    });
  }

  setMessage(messagesList) {
    var messagesappp = [];
    var useridapp = [];
    List<Map<String, dynamic>> nouvelleListe = (messagesList.value as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
    print(nouvelleListe[0]["name"]);
    print(windex);
    for (var i = 0; i < messagesList.children.length; i++) {
      messagesappp.add(nouvelleListe[i]["name"].toString());
      useridapp.add(nouvelleListe[i]["userid"].toString());
    }
    setState(() {
      messages = messagesappp;
      userid = useridapp;
      numberapp = messagesList.children.length;
    });
    Future.delayed(Duration(milliseconds: 50), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    asyncapp();
    if (messages.isEmpty) {
      return const Text("null");
    } else {
      return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController, // Ajout du controller ici
                itemCount: numberapp,
                itemBuilder: (context, index2) {
                  if (userid[index2] != user!.uid) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child:
                          MessageLeft(index2, widget.index, messages, useridjson,userid),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child:
                          MessageRight(index2, widget.index, messages, useridjson,userid),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CupertinoSearchTextField(
                            controller:
                                _textFieldController, // Ajouter cette ligne
                            onChanged: (value) {
                              send = value;
                            },
                            placeholder: "send a message",
                            prefixIcon: Text(""),
                          )),
                    ),
                  ),
                ),
                CupertinoButton(
                  child: const Icon(
                    Icons.send_rounded,
                    color: CupertinoColors.activeGreen,
                    size: 30,
                  ),
                  onPressed: () async {
                    print('Message will be send');
                    _textFieldController.clear();
                    // Obtenez l'ID de l'utilisateur
                    String uid = user!.uid;

                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref("message/groupes/${widget.index}/messages");

                    await ref.update({
                      "${messages.length}": {"name": send, "userid": uid},
                    });
                    print("Message sent : ${messages.length}");
                  },
                )
              ],
            )
          ],
        ),
      );
    }
  }
}

Widget MessageRight(index2, index, messages, useridjson,userid) {
  return Row(
    children: [
      Expanded(
        child: Container(),
      ),
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: CupertinoColors.activeBlue,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  messages[index2],
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
          Text(
            useridjson[userid[index2]],
            style: const TextStyle(
                color: CupertinoColors.systemGrey, fontSize: 15),
          ),
        ],
      )
    ],
  );
}

Widget MessageLeft(index2, index, messages, useridjson,userid) {
  return Row(
    children: [
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: CupertinoColors.activeGreen,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  messages[index2],
                  style: const TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
          ),
          Text(
            useridjson[userid[index2]],
            style: const TextStyle(
                color: CupertinoColors.systemGrey, fontSize: 15),
          ),
        ],
      ),
      Expanded(
        child: Container(),
      )
    ],
  );
}
