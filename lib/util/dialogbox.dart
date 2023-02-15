import 'package:flutter/material.dart';
import '../mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 0.8,
        // height: 300,
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text("New Task"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    // icon: Icon(Icons.add),
                    border: OutlineInputBorder(),
                    hintText: 'add new task'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Cancel", onPressed: () => onCancel()),
                MyButton(text: "Save", onPressed: () => onSave())
              ],
            )
          ],
        ),
      ),
    );
  }
}
