import 'package:apoio/adicionar.dart';
import 'package:apoio/lista%20usuarios.dart';
import 'package:flutter/material.dart';

import '../ListaNova.dart';

enum WhyFarther { harder, smarter }

// ignore: must_be_immutable
class Lista extends StatefulWidget {
  Lista({this.usu, this.tipo});
  final String usu;
  final String tipo;

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
            Icon(Icons.account_circle),
            Center(
                child:
                    Text(widget.usu + "   ", style: TextStyle(fontSize: 20))),
            PopupMenuButton<WhyFarther>(
              onSelected: (WhyFarther result) {
                switch (result) {
                  case WhyFarther.harder:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaUsuarios(),
                      ),
                    );

                    break;
                  case WhyFarther.smarter:
                    break;

                  default:
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<WhyFarther>>[
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Usuarios'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.smarter,
                  child: Text('Sobre'),
                ),
              ],
            ),
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
