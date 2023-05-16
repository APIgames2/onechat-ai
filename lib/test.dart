import 'package:flutter/material.dart';

Future<void> getmessage(context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Text("ouiiiii !")),
  );
}
