import 'package:flutter/material.dart';
import 'package:vacancies_go/pages/login.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacancies Go',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const LoginPage(title: 'Vacancies Go'),
    );
  }
}
