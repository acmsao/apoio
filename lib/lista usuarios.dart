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
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snaphots) {
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
                    title: Text(item['tipo']),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {

                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdicionarUsu(snaphots.data.documents[i].documentID)
                                      )
                                      );
                             
                            },
                            tooltip: "Editar",
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              Deletar(snaphots.data.documents[i].documentID,
                                  'usuarios');
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
