import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNotes extends StatefulWidget {
  //AddNotes({Key? key}) : super(key: key);
  final Function addNotesCallback;
  AddNotes(this.addNotesCallback);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final titleController = TextEditingController();
  final notesController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty || notesController.text.isEmpty) {
      return;
    }
    Fluttertoast.showToast(
        msg: '${titleController.text}, ${notesController.text}',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 12);

    widget.addNotesCallback(titleController.text, notesController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CloseButton(),
            ],
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Notes'),
            controller: notesController,
          ),
          ElevatedButton(
            onPressed: submitData,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
