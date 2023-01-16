import 'dart:io';

import 'package:notekeeper_with_sqlite_database/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  // ignore: unused_field
  static Database _database;

  String noteTable = 'note_table ';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //get the directoryb path for both android and ios to store database
    Directory directory = await getApplicationDucumentsDirectory();
    String path = directory.path + 'notes.db';
    //open /create the database at a given path
    var noteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTablev($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,'
        '$colDescription TEXT,&colPriority INTEGER,$colDate TEXT)');
  }

  //Fetch Operation:Get all the note objects from database
  Future<List<Map<String , dynamic>>>getNoteMapList() async {
    Database db = await this.database;
    //var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: ' $colPriority ASC');
    return result;
  }
  //Insert Operation:Insert a the note objects to database
  Future<int> insertNote(Note note)async{
     Database db = await this.database;
    //var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.insert(noteTable, note.toMap());
    return result;
    

  }
  //Update Operation:Update a   note objects from database
  Future<int> updateNote(Note note)async{
     Database db = await this.database;
    //var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    int result = await db.update(noteTable, note.toMap(),where:'$colId=?',whereArgs:[note.id]);
    return result;
    

  }
  
  //Delete Operation:Deletea note objects from database
  Future<int> deleteNote(Note note)async{
     Database db = await this.database;
    //var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.delete('DELETE FROM $noteTable WHERE $colId = id');
    return result;
    

  }
  //Get a  number  note objects from database
  Future<int> getCount(Note note)async{
     Database db = await this.database;
    //var result =await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    List<Map<String,dynamic>> x = await db.query('SELECT COUNT(*) from $noteTable');
    int result =Sqflite.firstIntValue(x);
    return result;
    

  }

}

openDatabase(String path,
    {required int version,
    required void Function(Database db, int newVersion) onCreate}) {}

getApplicationDucumentsDirectory() {}

class Database {
  execute(String s) {}
  
  query(String noteTable, {required String orderBy}) {}
  
  insert(String noteTable, map, {required String orderBy}) {}
}
