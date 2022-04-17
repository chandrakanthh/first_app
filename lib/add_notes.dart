import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNotes extends StatefulWidget {
  final AddNewNotes? addNewNotes;
  final Function editNotesCallBack;
  final Function addNotesCallback;
  AddNotes(this.addNotesCallback,this.editNotesCallBack, this.addNewNotes);

 // const AddNotes({Key? key,this.addNewNotes, required this.editNotesCallBack, required this.addNotesCallback}) : super(key: key);

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

    if(widget.addNewNotes!=null) {
      widget.editNotesCallBack(titleController.text, notesController.text);
    } else {
      widget.addNotesCallback(titleController.text, notesController.text);
    }
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
