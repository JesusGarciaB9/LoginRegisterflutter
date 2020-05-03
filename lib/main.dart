import 'package:flutter/material.dart';
import 'Signup.dart';
import 'components/widgetsbasicos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider.dart';
import 'LoginHome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: LoginHome(),
    );
  }
}
