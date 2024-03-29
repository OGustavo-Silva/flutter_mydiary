import 'package:my_diary/note.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'dart:convert';

class FoldersBuild {
  final title = "MyDiary";
  String fullYear = DateTime.now().toString();
  String year = "";
  String month = "";
  String myDiaryPath = "";

  FoldersBuild() {
    year = fullYear.substring(0, 4);
    month = fullYear.substring(5, 7);
    myDiaryPath = "$title/$year/$month";
  }
//Vars for files/directories config

  void createFolder() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    File('${directory.path}/$myDiaryPath/myJournal.txt')
        .create(recursive: true);
  }

  Future<List<Note>> checkExistingNotes() async {
    try {
      List<Note> notesList = [];

      final Directory directory =
          await getApplicationDocumentsDirectory(); //Return Documents folder equivalent

      final diaryDir = "${directory.path}/${title}";
      final List<FileSystemEntity> homeDirItems =
          await Directory(diaryDir).list().toList();
      //homeDirItems.forEach((element) {print(element);}); //print every file/dir in myDiary folder

      final Iterable<Directory> homeDirDirectories =
          homeDirItems.whereType<Directory>();
      List<String> homeDirDirsList = [];
      homeDirDirectories.forEach((element) {
        var dirName = element.toString();
        homeDirDirsList
            .add(path.basename(dirName.substring(0, dirName.length - 1)));
      });
      homeDirDirsList.sort();

      //run over years directories
      for (int i = homeDirDirsList.length - 1; i >= 0; i--) {
        var yearDirectory =
            Directory("${directory.path}/${title}/${homeDirDirsList[i]}");

        final List<FileSystemEntity> yearDirItems =
            await Directory(yearDirectory.path).list().toList();
        final Iterable<Directory> yearDirDirectories =
            yearDirItems.whereType<Directory>();

        List<String> yearDirDirsList = [];
        yearDirDirectories.forEach((element) {
          var dirName = element.toString();
          yearDirDirsList
              .add(path.basename(dirName.substring(0, dirName.length - 1)));
        });
        yearDirDirsList.sort();
        yearDirDirsList.forEach((element) {});

        //run over the months directories inside i=year directory, open myJournal.txt and create note obj
        for (int j = yearDirDirsList.length - 1; j >= 0; j--) {
          final File file = File(
              "${directory.path}/${title}/${homeDirDirsList[i]}/${yearDirDirsList[j]}/myJournal.txt");
          String notes = await file.readAsString();

          LineSplitter ls = new LineSplitter();
          List<String> notesListTxt = ls.convert(notes);

          notesListTxt.forEach((element) {
            Note note = Note.fromJson(jsonDecode(element));
            notesList.add(note);
          });
        }
      }
      return notesList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<File> writeData(String title, String content) async {
    Note newNote = Note(title, content, DateTime.now(), DateTime.now());
    var noteJson = jsonEncode(newNote);
    print(noteJson);

    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File("${directory.path}/$myDiaryPath/myJournal.txt");
    return file.writeAsString(noteJson, mode: FileMode.append);
  }
}
