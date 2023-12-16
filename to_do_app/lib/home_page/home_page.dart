import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/date_base.dart';
import 'package:to_do_app/utilite/dailog_box.dart';
import 'package:to_do_app/utilite/search.dart';
import '../utilite/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();

  ToDoDateBase datebase = ToDoDateBase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      datebase.createInitialData();
    } else {
      datebase.loadDate();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      datebase.toDoList[index][1] = !datebase.toDoList[index][1];
    });
    datebase.updateDateBase();
  }

  void saveNewTask() {
    setState(() {
      datebase.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    datebase.updateDateBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            saveNewTask();
          },
          onCansel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      datebase.toDoList.removeAt(index);
    });
    datebase.updateDateBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/corable.jpg'),
              ),
            ),
            IconButton(
              iconSize: 35,
              icon: const Icon(Icons.add),
              onPressed: () {
                createNewTask();
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const SearshPage(),
            Expanded(
              child: ListView.builder(
                itemCount: datebase.toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: datebase.toDoList[index][0],
                    taskComplated: datebase.toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) {
                      deleteTask(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
