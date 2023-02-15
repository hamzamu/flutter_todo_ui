import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_mi_koko/mybutton.dart';
import 'package:to_do_app_mi_koko/todotile.dart';
import 'package:to_do_app_mi_koko/util/dialogbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names

  // final MyBox = Hive.openBox('mybox');

  final _newTaskController = TextEditingController();
  late List TodoList = [
    ['create tutorial', false],
    ['apply tutorial', false]
  ];

//
  void checkboxChanged(bool value, int index) {
    setState(() {
      print(value);
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void setNewTask() {
    print('setting new tasks');
    setState(() {
      TodoList.add([_newTaskController.text, false]);
    });
    Navigator.of(context).pop();
    _newTaskController.text = " ";
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _newTaskController,
            onCancel: () => Navigator.of(context).pop(),
            onSave: () => setNewTask(),
          );
        });
  }

  // remove tasks
  void removeTask(index) {
    setState(() {
      TodoList.removeAt(index);
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
        ),
        body: ListView.builder(
          itemCount: TodoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: TodoList[index][0],
                taskCompleted: TodoList[index][1],
                onRemove: () => removeTask(index),
                deleteFunc: (context) => removeTask(index),
                onChanged: (value) => checkboxChanged(value!, index));
          },
        ));
  }
}
