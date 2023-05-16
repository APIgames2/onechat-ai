// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradiantbutton/gradiantbutton.dart';
import 'navbar.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Launch IOS Simulator 

var _size = true;
var _position = false;
var hello = "hello world";

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future<void> positionapp() async {
      Future.delayed(const Duration(seconds: 4));
      setState(() {
        _position = true;
      });
      print("position is $_position");
    }

    positionapp();
    print(_position ? 100.0 : 0);

    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 57, 130, 60)),
          useMaterial3: true),
      title: 'onechat',
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Navbar();
            } else {
              return Container(
                  color: CupertinoColors.black,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          const Text(
                            "Welcome to Onechat",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.white),
                          ),
                          const Text(
                            " security",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.systemRed),
                          ),
                          Image.network(
                            "https://dub06pap001files.storage.live.com/y4mXowvq_Ps7sXUunKic7LS7YyBBNQailr3Z7OkKNpxi-RVDZbq33OeJI5gnlVNLICH_OGlI6hUp-GboD0WUcjPNGMoZ-iLY8r8xgR-IBO0N-Qf66Zle-0sb-e6VwMQHUmHoV5Jmfm00eSVB3hAb-IeS6SJgtsY83UkcfLSQiKZhphxhgiyjb8XmcWXanw9un77?width=500&height=500&cropmode=none",
                            scale: 10,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: CupertinoButton.filled(
                          child: const Text("continue"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ));
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      "Login",
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
                      "Please sign in to continue",
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
                                      SignIn();
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
                                          'Login',
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
                                          _handleSignIn();
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
                        "don't have a account ?",
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
                          "Sign up",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 181, 71),
                          ),
                        ),
                        onPressed: () {},
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

  Future<void> SignIn() async {
    print(emailcontroller.text.trim());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim());
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
