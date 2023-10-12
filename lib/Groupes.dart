// ignore_for_file: file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fonctions/getmessage.dart';
import 'chat.dart';

var namegroupe = '';

var descriptiongroupe = '';

var namegroupes = [];

var descrgroupes = [];

var numberofgroupes = 0;

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Edit",
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 125, 230),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Sf"),
                ),
                const Spacer(),
                const Text(
                  "Messages",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontFamily: "Sf"),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    _showSimpleModalDialog(context);
                  },
                  icon: const Icon(CupertinoIcons.square,
                      color: Color.fromARGB(255, 127, 125, 230)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "https://lh3.googleusercontent.com/0k6NmC-ScqMVwBsPbChlO660hn3QwrO4QC4J6akBc4dh_hriqDdAAG7mrTMNE7ab_wWnpJyH6dnwRYMAt23TNuDFwQ",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          "Priam",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJe_s3yBHzcnWIRt_sUJ07S7a8L1KiDi-0Ag&usqp=CAU",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          "Jessica",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Couleur de l'ombre
                                offset: const Offset(3, 3),
                                blurRadius: 10, // Flou de l'ombre
                                spreadRadius: 5, // Étalement de l'ombre
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.network(
                              "http://s3.amazonaws.com/brt.org/tim-cook-3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Apple",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sf",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numberofgroupes,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 65),
                        height: 1,
                        color: const Color.fromARGB(255, 212, 212, 218),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: Image.asset(
                                "images/sundae.jpeg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    namegroupes[index],
                                    style: TextStyle(
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    descrgroupes[index],
                                    style: TextStyle(
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 149, 149, 155),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(CupertinoIcons.arrow_right),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Chat(mode: 1, index: index)),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
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
            constraints: const BoxConstraints(maxHeight: 350, maxWidth: 300),
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
                          color: Color.fromARGB(255, 255, 255, 255),
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
