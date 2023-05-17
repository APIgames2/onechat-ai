// ignore_for_file: file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fonctions/getmessage.dart';
import 'chat.dart';
import 'package:uuid/uuid.dart';

var namegroupe = '';

var descriptiongroupe = '';

var namegroupes = [];

var descrgroupes = [];

var numberofgroupes = 0;

var delete = false;

class Message {
  final String content;

  Message({required this.content});

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      content: map['content'] ?? '',
    );
  }
}

class Groupes extends StatefulWidget {
  const Groupes({Key? key}) : super(key: key);

  @override
  _GroupesState createState() => _GroupesState();
}

class _GroupesState extends State<Groupes> {
  @override
  Widget build(BuildContext context) {
    Future<void> getgroupes() async {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("message/groupes");
      final snapshot = await ref.get();
      List<Map<String, dynamic>> nouvelleListe = (snapshot.value as List)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      var namefgdh = [];
      var groupesg = [];

      for (var i = 0; i < snapshot.children.length; i++) {
        namefgdh.add(nouvelleListe[i]["name"].toString());
        groupesg.add(nouvelleListe[i]["description"].toString());
      }
      setState(() {
        namegroupes = namefgdh;
        descrgroupes = groupesg;
        numberofgroupes = snapshot.children.length;
      });
    }

    Future<void> asyncapp() async {
      FirebaseDatabase.instance
          .ref("message/groupes")
          .onValue
          .listen((event) async {
        getgroupes();
      });
    }

    asyncapp();
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  FilledButton.tonal(
                    child: const Text("edit"),
                    onPressed: () {
                      
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  FilledButton.tonal(
                    child: const Icon(
                      Icons.edit_calendar,
                    ),
                    onPressed: () async {
                      _showSimpleModalDialog(context);
                    },
                  )
                ],
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 7),
                  child: Text(
                    "Messages",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 50,
                  color: const Color(0xffd5ebcf),
                  child: Center(
                    child: Row(
                      children: [
                        FilledButton.tonal(
                          onPressed: () {},
                          child: const Icon(Icons.search),
                        ),
                        const Spacer(),
                        FilledButton.tonal(
                          onPressed: () {},
                          child: const Icon(Icons.keyboard_voice_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
              child: ListView.builder(
            itemCount: numberofgroupes,
            itemBuilder: (context, index) {
              if (namegroupes.isEmpty && descrgroupes.isEmpty) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else {
                return Flex(
                  direction: Axis.horizontal,
                  children: [
                    Visibility(
                      visible: delete ? true : false,
                      child: Flexible(
                        flex: 1,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                              child: Center(
                            child: IconButton(
                              icon: const Icon(Icons.delete_rounded),
                              color: Colors.red,
                              onPressed: () {
                                final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
                                databaseReference.child('message').child("groupes").child("$index").remove().then((_) {
                                  print('Données supprimées avec succès.');
                                }).catchError((error) {
                                  print('Erreur lors de la suppression des données : $error');
                                });

                              },
                            ),
                          )),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          children: [
                            CupertinoListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                    "https://dub06pap001files.storage.live.com/y4mcC2WwcFDlfFyTreLvoRsh7v2UX84U49jXgttwaxeYVGwRNVToKysA_etSuJVvShu8TsEqA9tnMm-DMsfmF2cgQCAGvX48fXN9okClUWhCboCO5OWz3uLYuqmbnxCcqo89QtE98-M1sRABQ7p37cHG7ADhhbrUuuuUtfiAGvThPgDgvlTcjluKviREXWKMRi9?width=1000&height=1000&cropmode=none"),
                              ),
                              title: Text(namegroupes[index]),
                              subtitle: Text(descrgroupes[index]),
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 15),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) {
                                    return Chat(
                                      mode: 1,
                                      index: index,
                                    );
                                  }));
                                },
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create a Groupe",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  const Text(
                    "Name's groupe",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      namegroupe = value;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10), // Added this
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 166, 188, 160),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Description's groupe",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    onChanged: (value) {
                      descriptiongroupe = value;
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10), // Added this
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 166, 188, 160),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("annuler"),
                      ),
                      const Spacer(),
                      FilledButton.tonal(
                        onPressed: () {
                          createagroupe(namegroupe);
                        },
                        child: const Text("Create a groupe"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> createagroupe(name) async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref().child("message/groupes");
  final snapshot = await ref.get();
  var groupe = snapshot.children.length;
  await ref.update({
    "$groupe": {
      "name": namegroupe,
      "description": descriptiongroupe,
      "messages": {
        0: {"userid": 0, "name": "Weclome to $name"}
      }
    }
  });
  FirebaseDatabase.instance
      .ref("message/groupes/0/message")
      .onValue
      .listen((event) {
    getmessage();
  });
}
