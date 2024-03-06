import 'package:flutter/material.dart';
import 'package:my_diary/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(197, 94, 94, 94)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  note.createdDate.toString().substring(0, 10),
                  style: const TextStyle(
                      color: Color.fromARGB(200, 200, 200, 200)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                note.content.substring(0),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
