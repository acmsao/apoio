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
              padding: const EdgeInsets.all(5),
              child: ListTile(
                onTap: () {
                  try {
                    Externo(item['link']);
                  } on Exception {
                    AboutDialog(
                      children: [Text('Link invalido')],
                    );
                  }
                },
                leading: Text(item['curso'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                title: Text(item['materia']),
                subtitle: Text(
                  item['descricao'],
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // IconButton(
                      //   icon: Icon(Icons.arrow_forward),
                      //   color: Colors.blue,
                      //   onPressed: () {
                      //     try {
                      //       Externo(item['link']);
                      //     } on Exception {
                      //       AboutDialog(
                      //         children: [Text('Link invalido')],
                      //       );
                      //     }
                      //   },
                      //   tooltip: "Abrir o video no youtube",
                      // ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlertDialog(
                                  title: Text('Apagar Item'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Deseja realmente apagar este item?',
                                            style: TextStyle(fontSize: 20)),
                                        Padding(padding: EdgeInsets.all(20)),
                                        Text('Esta ação é irreversível'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Deletar(
                                              snaphots
                                                  .data.documents[i].documentID,
                                              'item');
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Apagar',
                                            style: TextStyle(fontSize: 20))),
                                    Padding(padding: EdgeInsets.all(40)),
                                    FlatButton(
                                      child: Text(
                                        'Voltar',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ));
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
