import 'package:flutter/material.dart';
import 'package:my_diary/note.dart';

class noteWidget extends StatelessWidget{
  Note? note;
  noteWidget({super.key, this.note});

  @override
  Widget build(BuildContext context){
    if(note.isEmpty()){

    }

    return Row(
      children: [
        Text(note.title),
        Text(note.content),
      ],
    )
  }
}