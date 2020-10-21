import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Adicionar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var snapshots = Firestore.instance.collection('item');
    TextEditingController txtcurso = TextEditingController();
    TextEditingController txtmateria = TextEditingController();
    TextEditingController txtdescricao = TextEditingController();
    TextEditingController txtlink = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Apoio ao estudo de engenharia',
            style: TextStyle(height: 1, fontSize: 18)),
        leading: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset('imagens/logo.png'),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('imagens/apoio2.png'),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white.withOpacity(0.9),
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(50)),
                Text(
                  "Adicionar novo item",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txtcurso,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Curso",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txtmateria,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Matéria",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txtdescricao,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Descrição",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txtlink,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Link",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 10],
                            colors: [
                              Colors.red,
                              Colors.orange,
                            ],
                          ),
                        ),
                        child: FlatButton(
                            onPressed: () {
                              snapshots.add({
                                'curso': txtcurso.text,
                                'materia': txtmateria.text,
                                'descricao' : txtdescricao.text,
                                'link' : txtlink.text
                              });
                               Navigator.pop(context);
                            },
                            child: Text("Adicionar")),
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      Container(
                        height: 40,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.1, 10],
                            colors: [
                              Colors.orange,
                              Colors.red,
                            ],
                          ),
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancelar")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
