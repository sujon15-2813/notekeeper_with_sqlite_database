//import 'package:flutter/scheduler.dart';

//import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class Note {
  final int _id;
  String _title;
  final String _description;
  late final String _date;
  late final int _priority;
  Note(this._id, this._title, this._date, this._priority, this._description);
  Note.withId(
      this._id, this._title, this._date, this._priority, this._description);

  //Note(this._title, this._date, this._priority, [this._description]);
  //Note.withId(this._id, this._title, this._date, this._priority,
  //[this._description]);
  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _title = description;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  toMap() {}

  // set priority(int  newPriority) {
  //   if (newPriority >= 1 && newPriority  2) {
  //     this._priority = newPriority;
  //   }
  // }
  //Convert a note object into a map object 
  // Map<String, dynamic> toMap(){
  //   var map =Map<String, dynamic>(){
  //     if(id !=null){
  //       map['id']=_id;

  //     }
  //     map['title']=_title;
  //       map['description']=_description;
  //       map['priority']=_priority;
  //       map['date']=_date;
  //        return map;
  //   }

  // }
  // Map<String,dynamic> toMap(){
  //   // ignore: prefer_function_declarations_over_variables
  //   var map =Map<String,dynamic>(){
  //     if(id !=null){
  //       map['id']=_id;

  //     }
  //     map['title']=_title;
  //       //var map2 = map;
  //       map['description']=_description;
  //       map['priority']=_priority;
  //       map['date']=_date;
  //       return map;
  //    };

  // }
  // //Extract Note object from a Map object 
  // Note.fromMapObject(Map<String ,dynamic>map){
  //    this._id=map['id'];
  //    this._title=map['title'];
  //    this._description=map['description'];
  //    this._priority=map['priority'];
  //    this._date=map['date'];

  // }
}
