
// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'contactlist.dart';
import 'contactsInfo.dart';

class Contact extends StatefulWidget {
  Contact({Key? key, required this.contactmode, required this.contactSelected, required this.index})
      : super(key: key);
  final int contactmode;
  int contactSelected;
  final int index;
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  @override
  Widget build(BuildContext context) {
    bool isMobile(context) => MediaQuery.of(context).size.width < 680;

    if (widget.contactmode == 0) {
      if (isMobile(context)) {
        return Container(
          color: Color.fromARGB(255, 255, 255, 255),
          width: 310,
          child: const Contacts(),
        );
      } else {
        return Row(
          children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 310,
              child: const Contacts(),
            ),
            Expanded(
              child: ContactsInfo(
                selected: widget.contactSelected,
              ),
            )
          ],
        );
      }
    }
    if (widget.contactmode == 1) {
      if (isMobile(context)) {
        return ContactsInfo(
          selected: widget.contactSelected,
        );
      } else {
        return Row(
          children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 310,
              child: const Contacts(),
            ),
            Expanded(
              child: ContactsInfo(
                selected: widget.contactSelected,
              ),
            )
          ],
        );
      }
    } else {
      if (isMobile(context)) {
        return ContactsInfo(
          selected: widget.contactSelected,
        );
      } else {
        return Row(
          children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 310,
              child: const Contacts(),
            ),
            Expanded(
              child: ContactsInfo(
                selected: widget.contactSelected,
              ),
            )
          ],
        );
      }
    } 
  }
}
