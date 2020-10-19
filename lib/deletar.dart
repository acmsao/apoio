import 'package:cloud_firestore/cloud_firestore.dart';

class Deletar {
  Deletar(id) {
    var snapshots = Firestore.instance.collection('item');

    snapshots.document(id).delete();
  }
}
