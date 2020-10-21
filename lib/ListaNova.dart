import 'package:apoio/deletar.dart';
import 'package:apoio/externo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaNova extends StatefulWidget {
  @override
  _ListaNovaState createState() => _ListaNovaState();
}

class _ListaNovaState extends State<ListaNova> {
  TextEditingController txtlink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var snapshots = Firestore.instance.collection('item').snapshots();

    return Container(
        child: StreamBuilder(
      stream: snapshots,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snaphots) {
        if (snaphots.hasError) {
          return Center(child: Text('Erro ${snaphots.error}'));
        }

        if (snaphots.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snaphots.data.documents.length == 0) {
          return Center(child: Text("Lista Vazia"));
        }

        return ListView.separated(
          itemCount: snaphots.data.documents.length,
          itemBuilder: (context, int i) {
            var item = snaphots.data.documents[i].data;

            return Container(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                leading: Text(item['curso']),
                title: Text(item['materia']),
                subtitle: Text(
                  item['descricao'],
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          try {
                            Externo(item['link']);
                          } on Exception {
                            AboutDialog(
                              children: [Text('Link invalido')],
                            );
                          }
                        },
                        tooltip: "Abrir o video no youtube",
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Deletar(snaphots.data.documents[i].documentID,'item');
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      },
    ));
  }
}
