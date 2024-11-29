class Student {
  int id;
  String name;
  int score;
  Student({required this.id, required this.name, required this.score});
  Map<String, dynamic> toMap(){
    return {'id':id, 'name':name, 'score':score};
  }
}
