import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradiantbutton/gradiantbutton.dart';
import 'package:onechatai/main.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://dub06pap001files.storage.live.com/y4mwtUMhKeBDqJFSeR50lRa-DGTzXP_vzLVkv9PC3YXOBeFW9_1CPS4iTb4SiiPrUzi2dHJTRvAzBPH9Y7kKgOkD7Aer2HIQiSaQVVTWHX1XDF6NI5FJ1EkX6bb69uK68ZkwOz9HrW4ELWn5sCYqdjiR99Saa1TjlO3ZqnSPS39MXrbISkdM1hAEHdWfynm1zls?width=1350&height=619&cropmode=none"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: SizedBox(
        width: max(350, 0),
        height: max(600, 0),
        child: RepaintBoundary(
          child: Card(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 0, 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Please sign up to continue",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.systemGrey3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                              child: const Text(
                                "nom d'utilisateur",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.systemGrey3),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CupertinoSearchTextField(
                                controller: emailcontroller,
                                prefixIcon: const Icon(CupertinoIcons.mail),
                                placeholder: "nom d'utilisateur",
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey3),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                              child: const Text(
                                "mot de passe",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.systemGrey3),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CupertinoTextField(
                                obscureText: true,
                                controller: passwordcontroller,
                                prefix: const Icon(CupertinoIcons.lock),
                                placeholder: "mot de passe",
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CupertinoColors.systemGrey3),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              width: 100,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: GradiantButton(
                                    gradient: const LinearGradient(
                                      colors: <Color>[
                                        Color.fromARGB(255, 255, 213, 150),
                                        Color.fromARGB(255, 255, 181, 71),
                                      ],
                                    ),
                                    onPressed: () {
                                      SignUp();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           const Navbar()),
                                      // );
                                    },
                                    radius: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        const Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Container(
                                          width: 5,
                                        ),
                                        const Icon(
                                          CupertinoIcons.arrow_right,
                                          color: CupertinoColors.white,
                                        ),
                                        Expanded(
                                          child: Container(),
                                        )
                                      ],
                                    )),
                              ))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          children: [
                            CupertinoButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CupertinoColors.systemGrey6),
                                        onPressed: () {
                                        },
                                        child: Image.network(
                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CupertinoColors.systemGrey6),
                                        onPressed: () {},
                                        child: Image.network(
                                            "https://cdn.onlinewebfonts.com/svg/img_111594.png"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CupertinoColors.systemGrey6),
                                        onPressed: () {},
                                        child: Image.network(
                                            "https://purepng.com/public/uploads/large/purepng.com-microsoft-logo-iconlogobrand-logoiconslogos-251519939091wmudn.png"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 5,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                CupertinoColors.systemGrey6),
                                        onPressed: () {},
                                        child: Image.network(
                                            "https://seeklogo.com/images/M/meta-icon-new-facebook-2021-logo-83520C311D-seeklogo.com.png"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      const Text(
                        "you have a account ?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.systemGrey3),
                      ),
                      Container(
                        width: 10,
                      ),
                      TextButton(
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 181, 71),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()
                          ),
                    );
                        },
                      ),
                      Expanded(
                        child: Container(),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      )),
    );
    
  }
  Future<void> SignUp() async {
    if (kDebugMode) {
      print(emailcontroller.text.trim());
    }
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim());
  }
}

