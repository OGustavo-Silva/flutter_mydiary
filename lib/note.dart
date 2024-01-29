class Note{
  String title;
  String content;
  DateTime createdDate;
  DateTime updatedDate;

  Note(this.title, this.content, this.createdDate, this.updatedDate);

  Map toJson()=>{
    'title': title,
    'content': content,
    'createdDate': createdDate.toString(),
    'updatedDate': updatedDate.toString(),
  };

}