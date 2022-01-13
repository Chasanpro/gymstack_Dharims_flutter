import 'package:dharims/Firebase/Dash.dart';
import 'package:dharims/Firebase/Delete.dart';
import 'package:dharims/Firebase/create.dart';
import 'package:dharims/Firebase/find.dart';
import 'package:dharims/login.dart';
import 'package:dharims/panel.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: login(),
    );
  }
}
