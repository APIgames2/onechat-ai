import 'package:firebase_database/firebase_database.dart';
import 'getmessage.dart';

Future<void> asyncapp() async {
  FirebaseDatabase.instance
      .ref("message/groupes/0/message")
      .onValue
      .listen((event) {
    getmessage();
  });
}
