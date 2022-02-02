import 'package:attendence/Models/Login.dart';
import 'package:attendence/Widgets/Login.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'Widgets/HomePage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoginAdapter());
  await Hive.openBox<Login>('Login');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
