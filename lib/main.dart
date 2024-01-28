import 'package:flutter/material.dart';
import 'package:my_diary/new_entry_route.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    title: "MyDiary",
    home: MyApp(),
  ));
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

  updateText() {
    readNotes();
    setState(() {
      text += "\nadicionado";
    });
  }

  Future<File> writeData() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/notes.txt');
    return file.writeAsString('Hello, World!');
  }

  Future<String> readNotes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/notes.txt');
      String notes = await file.readAsString();
      print(notes);
      return notes;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("MyDiary"),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(199, 255, 255, 255)),
        body: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const NewEntryRoute())
            );
          },
          backgroundColor: const Color.fromARGB(199, 255, 255, 255),
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(0, 56, 56, 56),
      );
    
  }
}
