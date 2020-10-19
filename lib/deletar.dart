import 'package:cloud_firestore/cloud_firestore.dart';

class Deletar {
  Deletar(id) {
    Firestore.instance.collection('item').document(id).delete();
  }
}
