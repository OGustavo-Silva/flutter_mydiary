import 'package:flutter/material.dart';
import 'package:my_diary/new_entry_route.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  createFolder();
  runApp(const MaterialApp(
    title: "MyDiary",
    home: MyApp(),
  ));
  checkExistingNotes();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Vars for setting folders configs
const title = "MyDiary";
String fullYear = DateTime.now().toString();
String year = fullYear.substring(0, 4);
String month = fullYear.substring(5,7);
String myDiaryPath = "$title/$year/$month";

void createFolder() async{
  final Directory directory = await getApplicationDocumentsDirectory();
  File('${directory.path}/$myDiaryPath/myJournal.txt').create(recursive: true);
  }

void checkExistingNotes() async{
  final Directory directory = await getApplicationDocumentsDirectory();
  final stat = FileStat.statSync('${directory.path}/${title}');
  print("oia a pedra ${stat.changed}");
}

class _MyAppState extends State<MyApp> {
  String text = "hello world";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(title),
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
