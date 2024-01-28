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
        title: const Text("teste"),
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(

                  ),
                  TextFormField(

                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Discard"),
            ),
          ],
        ),
      ),
    );
  }
}
