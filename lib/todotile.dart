import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunc;
  VoidCallback onRemove;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunc,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          // Text('Index'),
          SlidableAction(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black26,
            onPressed: deleteFunc,
            icon: Icons.delete,
          )
        ]),
        child: Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Expanded(
                child: Text(
                  '$taskName',
                  style: TextStyle(
                      decoration:
                          taskCompleted ? TextDecoration.lineThrough : null),
                ),
              ),
              // Container(
              //   child: MaterialButton(
              //     onPressed: () => onRemove(),
              //     child: Icon(
              //       Icons.delete,
              //       color: Colors.black12,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
