import 'package:apoio/lista%20usuarios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdicionarUsu extends StatefulWidget {
  AdicionarUsu({this.id});
  final String id;

  @override
  _AdicionarUsuState createState() => _AdicionarUsuState();
}

class _AdicionarUsuState extends State<AdicionarUsu> {
  @override
  Widget build(BuildContext context) {
    var snapshots = Firestore.instance.collection('usuarios');
    TextEditingController txtnome = TextEditingController();
    TextEditingController txttipo = TextEditingController();
    TextEditingController txtsenha = TextEditingController();
    if (widget.id != null) {
      snapshots
          .where(snapshots.document().documentID, isEqualTo: widget.id)
          .getDocuments();
    }

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
                  controller: txtnome,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txtsenha,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: txttipo,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'adm ou usuario',
                      labelText: "Tipo",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      )),
                ),
                Padding(padding: EdgeInsets.all(10)),
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
                              if (txttipo.text != 'adm') {
                                txttipo.text = 'usuario';
                              }
                              snapshots.add({
                                'nome': txtnome.text,
                                'senha': txtsenha.text,
                                'tipo': txttipo.text,
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListaUsuarios()));
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
