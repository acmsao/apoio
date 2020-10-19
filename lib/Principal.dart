import 'package:flutter/material.dart';


class Princial extends StatefulWidget {


  @override
  _PrincialState createState() => _PrincialState();
}

class _PrincialState extends State<Princial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina principal'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(80),
        child: ListView(children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset('imagens/Univesp.jpg'),
          ),
          
        ]),
      ),
    );
  }
}
