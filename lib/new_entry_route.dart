import 'package:flutter/material.dart';

class NewEntryRoute extends StatefulWidget {
  const NewEntryRoute({super.key});

  @override
  State<NewEntryRoute> createState() => _NewEntryRouteState();
}

class _NewEntryRouteState extends State<NewEntryRoute> {
  final _formKey = GlobalKey<FormState>;

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
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(99, 164, 164, 164))),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Content",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(99, 164, 164, 164))),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(100, 150, 10, 0),
                          foregroundColor:
                              const Color.fromARGB(199, 255, 255, 255),
                        ),
                        child: const Text("Discard"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(100, 0, 150, 10),
                          foregroundColor:
                              const Color.fromARGB(199, 255, 255, 255),
                        ),
                      )
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
