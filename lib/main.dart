import 'package:first_app/add_notes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyNotesApp());

class MyNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notess',
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

  void _showAddNotesModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddNotes(_addNotesData);
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
        title: const Text('My Notessss'),
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
                    onPressed: () => _showAddNotesModal(context),
                    child: const Text("Add Notes"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("View All Notes"),
                  ),
                ],
              ),
              NotesListView(_addNotesList),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  final List<AddNewNotes> addNotesList;

  NotesListView(this.addNotesList);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
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
