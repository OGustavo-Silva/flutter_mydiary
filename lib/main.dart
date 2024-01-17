import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
    setState(() {
      text = "mudou";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyDiary",
      home: Scaffold(
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
          onPressed: () => updateText(),
          backgroundColor: const Color.fromARGB(199, 255, 255, 255),
          child: const Icon(Icons.add),
        ),
        backgroundColor: const Color.fromARGB(0, 56, 56, 56),
      ),
    );
  }
}
