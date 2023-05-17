// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'contact.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    var contactlist = ["Priam", "grégoire", "arthur", "tristan"];
    var noms = ["chambouvet", "boury", "enert beckey", "guyot bergeret"];
    var lettres = ["P", "G", "A", "T"];
    return Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ListView.builder(
              itemCount: contactlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Contact(
                                contactSelected: index,
                                contactmode: 2,
                                index: index,
                              )),
                    );
                  },
                  child: Container(
                    height: 60,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              lettres[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: CupertinoColors.systemGrey2),
                            ),
                            Spacer()
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              contactlist[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text(
                              " ${noms[index]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            Spacer()
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
