import 'package:flutter/material.dart';
import 'package:my_diary/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget(this.note);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          note.title,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          note.content,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          note.createdDate.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          note.updatedDate.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
