import 'package:flutter/material.dart';
import 'package:my_diary/folders_build.dart';
import 'package:my_diary/new_entry_route.dart';
import 'package:my_diary/note.dart';

Note testNote = Note.empty();
FoldersBuild foldersBuild = FoldersBuild();
Future<List<Note>> notesListFuture = foldersBuild.checkExistingNotes();
List<Note> notesList = [];

void main() {
  foldersBuild.createFolder();
  runApp(const MaterialApp(
    title: "MyDiary",
    home: MyApp(),
  ));
  notesListFuture.then((value) => {
        value.forEach((element) {
          notesList.add(element);
        })
      });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String text = "hello world";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: foldersBuild.checkExistingNotes(),
      initialData: testNote,
      builder: (BuildContext context, AsyncSnapshot<dynamic> test) {
        return Scaffold(
          appBar: AppBar(
              title: const Text("MyDiary"),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(199, 255, 255, 255)),
          body: Center(
              child: Column(children: <Widget>[
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            for(var note in notesList) Text(note.title, style: const TextStyle(color: Colors.white),),

            
            
          ])),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewEntryRoute()));
            },
            backgroundColor: const Color.fromARGB(199, 255, 255, 255),
            child: const Icon(Icons.add),
          ),
          backgroundColor: const Color.fromARGB(0, 56, 56, 56),
        );
      },
    );
  }
}
