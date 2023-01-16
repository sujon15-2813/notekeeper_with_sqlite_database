import 'package:flutter/material.dart';
import 'package:notekeeper_with_sqlite_database/NoteList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notekeeper',
      theme: ThemeData(
        
        primarySwatch: Colors.deepPurple,
      ),
      home: NoteList(),
    );
  }
}

