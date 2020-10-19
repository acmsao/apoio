import 'package:apoio/adicionar.dart';
import 'package:flutter/material.dart';

import '../ListaNova.dart';

// ignore: must_be_immutable
class Lista extends StatefulWidget {
  // var items = new List<Item>();

  // Lista() {
  //   items = [];
  //   items.add(Item(
  //       curso: "Computação",
  //       materia: "Calculo 1",
  //       link:
  //           "https://www.youtube.com/watch?v=XPoqRliIffQ&list=PLe82WKsecrpxi0JMDa8Qn_2cbB09fX8Sp"));
  //   items.add(Item(
  //       curso: "Computação",
  //       materia: "Fisica 1",
  //       link:
  //           "https://www.youtube.com/c/CristianoRAndrade/playlists?view=50&sort=dd&shelf_id=7"));
  //   items.add(Item(
  //       curso: "Computação",
  //       materia: "Eletrônica Digital",
  //       link:
  //           "https://www.youtube.com/watch?v=ToxLCBaOCws&list=PLULVdRyWd0odRqQlskF4gJgCyjWBrkdlb"));
  // }
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
            child: Image.asset('imagens/logo2.png',),
          ),
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
