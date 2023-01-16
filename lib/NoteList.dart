// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notekeeper_with_sqlite_database/NoteDetails.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);
  

  @override
  State<NoteList> createState() {
    
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetails('Add Note');
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return NoteDetails();
          // }));
        },
        tooltip: 'Add Note ',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    //TextStyle titleStyle = Theme.of(context).textTheme.;
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              'Dummy Title ',
              style: textStyle,
              //TextStyle(color: Colors.black),
            ),
            subtitle: Text('Dummy Date'),
            trailing: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetails('Edit Note');

              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return NoteDetails();
              // }));
            },
          ),
        );
      },
    );
  }

  void navigateToDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
