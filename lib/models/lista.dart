import 'package:apoio/adicionar.dart';
import 'package:apoio/externo.dart';
import 'package:apoio/lista%20usuarios.dart';
import 'package:apoio/models/login.dart';
import 'package:apoio/sobre.dart';
import 'package:flutter/material.dart';

import '../ListaNova.dart';

enum WhyFarther { harder, smarter, pesquisa }

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
                    Text(widget.usu + "   ", style: TextStyle(fontSize: 15))),
            PopupMenuButton<WhyFarther>(
              onSelected: (WhyFarther result) async {
                switch (result) {
                  case WhyFarther.harder:
                    var adm = await Login().usu(widget.usu);
                    print(adm);
                    if (adm == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaUsuarios(),
                        ),
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlertDialog(
                              title: Text('Não autorizado'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Acesso autorizado apenas para administradores',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
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
                    }

                    break;
                  case WhyFarther.smarter:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sobre(),
                      ),
                    );
                    break;
                  case WhyFarther.pesquisa:
                    Externo('https://forms.gle/GBPL8GfjErkYExms9');

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
                 const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.pesquisa,
                  child: Text('Pesquisa'),
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
