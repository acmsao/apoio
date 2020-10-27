import 'package:apoio/adicionar%20Usuario.dart';
import 'package:apoio/deletar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  TextEditingController txtlink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var snapshots = Firestore.instance.collection('usuarios').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body: StreamBuilder(
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
                  leading: Text(item['nome']),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        Text(item['tipo']),
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
                                              'Deseja realmente apagar este usuario?',
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
                                                snaphots.data.documents[i]
                                                    .documentID,
                                                'usuarios');
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarUsu(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
