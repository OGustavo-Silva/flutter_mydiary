import 'package:flutter/material.dart';
import 'package:my_diary/folders_build.dart';

class NewEntryRoute extends StatefulWidget {
  const NewEntryRoute({super.key});

  @override
  State<NewEntryRoute> createState() => _NewEntryRouteState();
}

class _NewEntryRouteState extends State<NewEntryRoute> {
  FoldersBuild foldersBuild = FoldersBuild();

  //final _formKey = GlobalKey<FormState>;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("New Entry"),
          backgroundColor: const Color.fromARGB(199, 255, 255, 255)),
      body: Center(
        child: Column(
          children: [
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: titleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(99, 164, 164, 164))),
                  ),
                  SizedBox(
                      height: 400,
                      child: TextFormField(
                        controller: contentController,
                        maxLines: null,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 40),
                            hintText: "Content",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(99, 164, 164, 164))),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text("Discard"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(17),
                              backgroundColor: Color.fromARGB(100, 150, 10, 0),
                              foregroundColor:
                                  const Color.fromARGB(199, 255, 255, 255),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              foldersBuild.writeData(titleController.text, contentController.text);
                              //Navigator.pop(context);
                            },
                            icon: const Icon(Icons.check),
                            label: const Text("Save"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(17),
                              backgroundColor:
                                  const Color.fromARGB(100, 0, 150, 10),
                              foregroundColor:
                                  const Color.fromARGB(199, 255, 255, 255),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(0, 56, 56, 56),
    );
  }
}
