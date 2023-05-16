// ignore_for_file: file_names, library_private_types_in_public_api, unrelated_type_equality_checks, prefer_typing_uninitialized_variables


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsInfo extends StatefulWidget {
  final int selected;
  const ContactsInfo({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  _ContactsInfoState createState() => _ContactsInfoState();
}

class _ContactsInfoState extends State<ContactsInfo> {
  @override
  Widget build(BuildContext context) {
    const info = [
      "issy les moulineaux",
      "069847863",
      "vide",
      "26/01/2012",
      "xmessage.com",
      "xapp.com"
    ];
    bool isMobile(context) => MediaQuery.of(context).size.width < 770;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                ),
                const Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  size: 100,
                ),
                Column(
                  children: [
                    Text("hi"),
                    Text("hi"),
                  ],
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                CupertinoButton(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: CupertinoColors.systemGreen,
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            CupertinoIcons.chat_bubble_fill,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const Text(
                        "message",
                        style: TextStyle(color: CupertinoColors.systemGreen),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 10,
                ),
                CupertinoButton(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: CupertinoColors.systemGreen,
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            CupertinoIcons.phone_fill,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const Text(
                        "appel",
                        style: TextStyle(color: CupertinoColors.systemGreen),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 10,
                ),
                CupertinoButton(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: CupertinoColors.systemGreen,
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            CupertinoIcons.video_camera_solid,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const Text(
                        "vidéo",
                        style: TextStyle(color: CupertinoColors.systemGreen),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                Container(
                  width: 10,
                ),
                CupertinoButton(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          color: CupertinoColors.systemGreen,
                          padding: const EdgeInsets.all(5),
                          child: const Icon(
                            CupertinoIcons.mail_solid,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const Text(
                        "E-mail",
                        style: TextStyle(color: CupertinoColors.systemGreen),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("lieux"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(info[0]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("numéro"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(info[1]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("autre numéro"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(info[2]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("date de naissance"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(info[3]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("site web"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 10,
                              ),
                              Text(info[4]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                    Table(
                      children: [
                        TableRow(children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const Text("autre site web"),
                              Container(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(info[5]),
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    const Divider(),
                  ],
                )),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 45),
              child: SizedBox(
                child: Center(
                  child: Row(
                    children: [
                      CupertinoButton(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 60,
                            height: 30,
                            color: CupertinoColors.systemGrey2,
                            child: const Icon(
                              CupertinoIcons.plus,
                              color: CupertinoColors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      CupertinoButton(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              width: 80,
                              height: 30,
                              color: CupertinoColors.systemGrey2,
                              child: const Center(
                                child: Text(
                                  "modifier",
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                ),
                              )),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
