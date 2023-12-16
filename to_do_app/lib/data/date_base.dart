import 'package:hive_flutter/hive_flutter.dart';

class ToDoDateBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ['Make Tutorioal', false],
      ['Do Exercise', false],
    ];
  }

  void loadDate() {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDateBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
