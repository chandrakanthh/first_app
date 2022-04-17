import 'dart:io';
import 'package:first_app/add_notes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyNotesApp());

class MyNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<AddNewNotes> _addNotesList = [
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
    AddNewNotes(title: "title", notes: "notes", id: 1),
  ];
  int randId = 0;
  void _addNotesData(String title, String notes) {
    final addNotes = AddNewNotes(title: title, notes: notes, id: randId++);
    Fluttertoast.showToast(
        msg: '$title, $notes, $randId',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.white,
        fontSize: 12);

    setState(() {
      _addNotesList.add(addNotes);
    });
  }

  void _deleteNotes(int indexPos){
    Fluttertoast.showToast(msg: "delete clicked",toastLength: Toast.LENGTH_SHORT);
    setState(() {
      _addNotesList.removeAt(indexPos);
    });
  }

  void _editNotes(int indexPos, AddNewNotes element) {
    _showAddNotesModal(context,indexPos,element);
  }

  void _editNotesData(int indexPos){
    Fluttertoast.showToast(msg: "_editNotesData clicked $indexPos",toastLength: Toast.LENGTH_SHORT);
    // setState(() {
    //   _addNotesList.insert(indexPos);
    // });
  }
  void _showAddNotesModal(BuildContext ctx, int? indexPos, AddNewNotes? element) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddNotes(_addNotesData,_editNotesData,element);
          // return GestureDetector(
          //   child: AddNotes(_addNotesData),
          //   //behavior: HitTestBehavior.opaque,
          // );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notess'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _showAddNotesModal(context,null,null),
                    child: const Text("Add Notes"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("View All Notes"),
                  ),
                ],
              ),
              NotesListView(_addNotesList,_deleteNotes, _editNotes),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  final List<AddNewNotes> addNotesList;
  final Function onDeleteCallBack;
  final Function onEditNoteCallBack;

  NotesListView(this.addNotesList, this.onDeleteCallBack, this.onEditNoteCallBack);


  void deleteNote(int indexPos){
    onDeleteCallBack(indexPos);
  }

  void editNotes(int indexPos){
    onEditNoteCallBack(indexPos);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        margin: const EdgeInsets.all(5),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            /*return Card(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('${addNotesList[index].id}'),
                  Column(
                    children: <Widget>[
                      Text(
                        addNotesList[index].title,
                      ),
                      Text(
                        addNotesList[index].notes,
                      ),
                    ],
                  )
                ],
              ),
            );*/
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child:Text(
                  addNotesList[index].id.toString(),
                  textAlign: TextAlign.center,
                ),),
                //TextButton(child: Text(addNotesList[index].id.toString(),),onPressed: () {},),
           /* Text(
            addNotesList[index].id.toString(),),*/
                title: Text(addNotesList[index].title),
                subtitle: Text(addNotesList[index].notes),
                isThreeLine: false,
                trailing: IconButton(
                  icon: const Icon(Icons.delete,),
                  onPressed: () => {
                    deleteNote(index)
                  },
                  color: Colors.red,
                ),
                onTap: () {
                  editNotes(addNotesList[index].id);
                },
              ),

            );
          },
          itemCount: addNotesList.length,
        ));
  }



}

//model class
class AddNewNotes {
  final String title;
  final String notes;
  final int id;

  AddNewNotes({required this.title, required this.notes, required this.id});
}
