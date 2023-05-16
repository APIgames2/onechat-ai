import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

Future<void> getmessage() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref().child("message/groupes/0/message");
  final snapshot = await ref.get();
  if (kDebugMode) {
    var snapchat = snapshot.value;
    print("\n\n\n$snapchat");
  }
  if (kDebugMode) {
    print(snapshot.children.length);
  }
  List<Map<String, dynamic>> nouvelleListe = (snapshot.value as List)
      .map((e) => Map<String, dynamic>.from(e))
      .toList();
  for (var i = 0; i < snapshot.children.length; i++) {
    if (kDebugMode) {
      print(nouvelleListe[i]["name"]);
    }
  }
}
