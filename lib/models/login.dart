import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login {
  BuildContext context;

  Future<bool> main(nome, senha) async {
    var db = Firestore.instance;
    var log;

    QuerySnapshot resultado = await db
        .collection('usuarios')
        .where('nome', isEqualTo: nome)
        .getDocuments();

    resultado.documents.forEach((element) {
      print(element.data);
      var usu = element.data['nome'];
      var sen = element.data['senha'];
      print(sen);
      print(usu);
      if (sen == senha) {
        print('ok');
        log = true;
      } else {
        print('errado');
        log = false;
      }
    });
    return log;
  }
}

