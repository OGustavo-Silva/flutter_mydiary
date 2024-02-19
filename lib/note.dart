class Note {
  String title ="";
  String content = "";
  DateTime createdDate = DateTime(1);
  DateTime updatedDate = DateTime(1);

  Note(this.title, this.content, this.createdDate, this.updatedDate);

  Note.empty() {
    title = "";
    content = "";
    createdDate = DateTime(1);
    updatedDate = DateTime(1);
  }

  Map toJson() => {
        'title': title,
        'content': content,
        'createdDate': createdDate.toString(),
        'updatedDate': updatedDate.toString(),
      };

/*
   Note.fromJson(Map<String, dynamic> json){
    title = json['title'];
    content = json['content'];
    createdDate = json['creadtedDate'];
    updatedDate = json['updatedDate'];
  }
*/

  factory Note.fromJson(dynamic json) {
    print("karaio ${json['createdDate']}");
    return Note(
        json['title'] as String,
        json['content'] as String,
        DateTime.parse(json['createdDate']),
        DateTime.parse(json['updatedDate']));
  }
}
