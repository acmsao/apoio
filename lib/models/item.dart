

class Item {
  String curso;
  String materia;
  String link;

  Item({this.curso, this.materia, this.link});

  Item.fromJson(Map<String, dynamic> json) {
    curso = json['curso'];
    materia = json['materia'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curso'] = this.curso;
    data['materia'] = this.materia;
    data['link'] = this.link;
    return data;
  }

 }
