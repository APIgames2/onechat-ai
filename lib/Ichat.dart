// ignore_for_file: dead_code


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

var messages = [];

var userid = [];

var number = 0;

var send = "";

var windex = 1;

var id = "0fs";

void getNumberOfMessages() async {
  // Créer une référence au document
  DocumentReference docRef =
      FirebaseFirestore.instance.collection("groupe").doc("0/messages");

  // Récupérer les données du document
  DocumentSnapshot docSnap = await docRef.get();
  Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;

  // Accéder à la longueur de la liste des messages
  int numberOfMessages = data["messages"].length;

  void addData() {
    print(id);
    // Créer une référence au document
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("groupe").doc("0/messages");
    // Ajouter un élément au champ "messages"
    docRef.update({
      numberOfMessages + 1: FieldValue.arrayUnion([
        {"userid": id, "name": "hello"}
      ])
    });
  }

  void addMessageAtPosition(int position) async {
    print(id);
    // Créer une référence au document
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("groupe").doc("0");

    // Exécuter une transaction
    FirebaseFirestore.instance.runTransaction((transaction) async {
      // Récupérer les données actuelles du document
      DocumentSnapshot docSnap = await transaction.get(docRef);
      Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;

      // Modifier la liste des messages en ajoutant un nouvel élément à la position spécifiée
      List<dynamic> messages = data["messages"];
      messages.insert(numberOfMessages, {"userid": id, "name": send});

      // Écrire les données modifiées dans le document
      transaction.update(docRef, {"messages": messages});
    });
  }

  addMessageAtPosition(numberOfMessages);
}

class Ichat extends StatefulWidget {
  const Ichat({Key? key, required this.index}) : super(key: key);
  final index;

  @override
  _IchatState createState() => _IchatState();
}

class _IchatState extends State<Ichat> {
  @override
  Widget build(BuildContext context) {
    void main() async {
      // Obtenez une référence au document
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('groupe').doc('0');

      // Obtenez les données du document
      DocumentSnapshot docSnapshot = await docRef.get();
      List messagesapp = docSnapshot.get('messages');

      // Affichez les données
      List<Map<String, dynamic>> nouvelleListe =
          (messagesapp).map((e) => Map<String, dynamic>.from(e)).toList();
      var messagesappp = [];
      var useridapp = [];
      for (var i = 0; i < messagesapp.length; i++) {
        messagesappp.add(nouvelleListe[i]["name"].toString());
        useridapp.add(nouvelleListe[i]["userid"].toString());
      }
      setState(() {
        messages = messagesappp;
        number = messagesappp.length;
        userid = useridapp;
      });
    }

    main();
    if (messages.isEmpty) {
      return Text("nuulll");
    } else {
      void main() async {
        // Obtenez l'utilisateur connecté
        User? user = FirebaseAuth.instance.currentUser;

        // Obtenez l'ID de l'utilisateur
        String uid = user!.uid;

        // Affichez les données
        setState(() {
          id = uid;
        });
      }

      main();
      return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: number,
                itemBuilder: (context, index2) {
                  if (userid[index2] == id) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: MessageRight(index2, widget.index, messages),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: MessageLeft(index2, widget.index, messages),
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
                  onPressed: () {
                    getNumberOfMessages();
                  },
                )
              ],
            )
          ],
        ),
      );
    }
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Spacer(),
            FilledButton.tonal(
              onPressed: () async {
                // Create a new user with a first and last name
                // final user = <String, dynamic>{
                //   "name" : "content",
                //   "userid" : 1
                // };

                // db.collection("groupe/0").add(user).then((DocumentReference doc) =>
                //     print('DocumentSnapshot added with ID: ${doc.id}'));
                // await db.collection("users").get().then((event) {
                //   for (var doc in event.docs) {
                //     print("${doc.id} => ${doc.data()}");
                //     setState(() {
                //       var messages = "${0} => ${doc.data()}";
                //       print("$messages is $messages");
                //     });
                //   }
                // });
//                 void addData() {
//   // Créer une référence au document
//   DocumentReference docRef = FirebaseFirestore.instance.collection("groupe").doc("0");

//   // Ajouter un élément au champ "messages"
//   docRef.update({
//     "messages": FieldValue.arrayUnion([
//       {"userid": 0, "name": "hello"}
//     ])
//   });
// }

                // addData();
              },
              child: Text("add data"),
            ),
            Text(messages.toString()),
            FilledButton.tonal(
              onPressed: () {
                void main() async {
                  // Obtenez une référence au document
                  DocumentReference docRef =
                      FirebaseFirestore.instance.collection('groupe').doc('0');

                  // Obtenez les données du document
                  DocumentSnapshot docSnapshot = await docRef.get();
                  List messagesapp = docSnapshot.get('messages');

                  // Affichez les données
                  List<Map<String, dynamic>> nouvelleListe = (messagesapp)
                      .map((e) => Map<String, dynamic>.from(e))
                      .toList();
                  var messagesappp = [];
                  for (var i = 0; i < messagesapp.length; i++) {
                    messagesappp.add(nouvelleListe[i]["name"].toString());
                  }
                  print(messagesappp);
                  setState(() {
                    messages = messagesappp;
                  });
                }

                main();
              },
              child: Text("read data"),
            ),
            Spacer()
          ],
        ),
        Spacer()
      ],
    );
  }
}

Widget MessageRight(index2, index, messages) {
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
            messages[index2],
            style: const TextStyle(
                color: CupertinoColors.systemGrey, fontSize: 15),
          ),
        ],
      )
    ],
  );
}

Widget MessageLeft(index2, index, messages) {
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
            messages[index2],
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
