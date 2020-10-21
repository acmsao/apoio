import 'package:cloud_firestore/cloud_firestore.dart';

class Deletar {
  Deletar(id,colecao) {
    Firestore.instance.collection(colecao).document(id).delete();
  }
}
