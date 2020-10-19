import 'package:apoio/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mensagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apoio ao estudo de engenharia',
              style: TextStyle(height: 1, fontSize: 18)),
              backgroundColor: Colors.red,
          leading: SizedBox(
            width: 250,
            height: 250,
            child: Image.asset('imagens/logo2.png'),
          ),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset('imagens/apoio2.png'),
          Container(
              color: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.all(80),
              child: ListView(children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('imagens/usu.png'),
                ),
                Padding(padding: EdgeInsets.all(20),),
                Text('Usuario ou senha incorretos',style: TextStyle(color: Colors.red,fontSize: 30,),textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.all(30)),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text('Voltar',style: TextStyle(color: Colors.black,fontSize: 40)))
              ]))
        ]));
  }
}
