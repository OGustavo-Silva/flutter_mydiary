class Note {
  String? title;
  String? content;
  DateTime? createdDate;
  DateTime? updatedDate;

  Note(this.title, this.content, this.createdDate, this.updatedDate);

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
    print("karaio ${json['createdDate'] }");
    return Note(json['title'] as String, json['content'] as String,
        DateTime.parse(json['createdDate']), DateTime.parse(json['updatedDate']));
  }
  
}
