// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Chat.dart';
import 'Groupes.dart';
import 'Settings.dart';
import 'contactlist.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 83, 150, 85),
          title: const Center(
            child: Text(
              "Onechat",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )),
      body: Center(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.send_rounded),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_2_fill),
                label: 'groupes',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings_solid),
                label: 'Setting',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                switch (index) {
                  case 0:
                    return const Groupes();
                  case 1:
                    return const Chat(mode: 0, index: 0);
                  case 2:
                    return const Contacts();
                  case 3:
                    return const Settings();
                  default:
                    return const Groupes();
                }
              },
            );
          },
        ),
      ),
    );
    //);
  }
}
