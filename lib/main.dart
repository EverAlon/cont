import 'package:contador/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: 'AIzaSyBYwF8xzFLhK9SbxNQWgAmHSYPJm18WHec',
    appId: '1:627387610740:android:9ebe15c26f637916abc321',
    messagingSenderId: '627387610740',
    projectId: 'verificacion-886d7',
    authDomain: 'com.example.contador',
    storageBucket: 'verificacion-886d7.appspot.com',
  ));

  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "874664834433450",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginPage(),
    );
  }
}