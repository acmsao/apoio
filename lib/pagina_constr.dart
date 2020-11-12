import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageConst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apoio ao estudo de engenharia',
              style: TextStyle(height: 1, fontSize: 18)),
          backgroundColor: Colors.red,
          leading: SizedBox(
            width: 300,
            height: 300,
            child: Image.asset('imagens/logo2.png'),
          ),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset('imagens/apoio2.png'),
          Container(
              color: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.all(10),
              child: ListView(children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('imagens/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  'Projeto Integrador para o curso de Engenharia da Computação da UNIVESP',
                  style: TextStyle(color: Colors.black,fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(20)),
                Text(
                  'Para acessar use o usuario: univesp e senha: 123',
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(30)),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Voltar',
                        style: TextStyle(color: Colors.black, fontSize: 30)))
              ]))
        ]));
  }
}
