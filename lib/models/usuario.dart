class Usuario {
  String id;
  String nome;
  String senha;

  Usuario({this.id, this.nome, this.senha});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['id'] = this.id;
    return data;
  }

 }