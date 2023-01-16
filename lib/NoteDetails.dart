import 'package:flutter/material.dart';
import 'package:notekeeper_with_sqlite_database/NoteList.dart';

class NoteDetails extends StatefulWidget {
  //const NoteDetails({Key? key}) : super(key: key);

  @override
  State<NoteDetails> createState() => _NoteDetailsState(this.appBarTitle);
  String appBarTitle;
  NoteDetails(this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  String appBarTitle;
  static var _priorities = ['Height', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  _NoteDetailsState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const NoteList()),
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              // title: DropdownButton(
              //   items:_priorities.map((String dropDownStringItem){
              //     return DropDownMenuItem<String> (
              //       value: dropDownStringItem,
              //       child:Text(dropDownStringItem),

              //  );
              //   }).toList(),
              //   onChanged: null,

              title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User Selected $valueSelectedByUser');
                    });
                  }),
            ),
            // 2nd Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            // 3rd Element

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Description');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            //4th Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint('Save Button Clicled');
                        });
                      },
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    height: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete  Button Clicled');
                        });
                      },
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
