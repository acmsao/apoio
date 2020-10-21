import 'package:apoio/adicionar.dart';
import 'package:flutter/material.dart';

import '../ListaNova.dart';

// ignore: must_be_immutable
class Lista extends StatefulWidget {
  Lista({this.usu});
  final String usu;

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de links"),
          leading: SizedBox(
            width: 128,
            height: 128,
            child: Image.asset(
              'imagens/logo2.png',
            ),
          ),
          actions: <Widget>[
            Text(widget.usu,)
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('imagens/apoio2.png'),
            Container(
              color: Colors.white.withOpacity(0.9),
            ),
            ListaNova(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Adicionar(),
              ),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
