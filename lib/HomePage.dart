import 'package:apoio/Mensagem.dart';
import 'package:apoio/models/lista.dart';
import 'package:apoio/models/login.dart';
import 'package:apoio/models/usuario.dart';
import 'package:apoio/pagina_constr.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  var items = new List<Usuario>();

  HomePage() {
    items = [];
    items.add(Usuario(id: "001", nome: "Anderson", senha: "12345"));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var teste = 'false';

  bool log;

  @override
  Widget build(BuildContext context) {
    TextEditingController txtnome = TextEditingController();
    TextEditingController txtsenha = TextEditingController();

    imageCache.clear();

    return Scaffold(
      appBar: AppBar(
        title: Text('Apoio ao estudo de engenharia',
            style: TextStyle(height: 1, fontSize: 18)),
        leading: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset('imagens/logo2.png'),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('imagens/logo.png'),
          Container(
            color: Colors.white.withOpacity(0.8),
            padding: EdgeInsets.all(80),
            child: ListView(children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('imagens/apoio2.png'),
              ),
              // Divider(

              //   height: 40,
              //   color: Colors.white,
              // ),
              TextFormField(
                controller: txtnome,
                keyboardType: TextInputType.name,
                obscureText: false,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "nome",
                    hintText: 'univesp',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
              ),
              // Divider(
              //   height: 40,
              //   color: Colors.white,
              // ),
              TextFormField(
                controller: txtsenha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Senha',
                    hintText: '123',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> PageConst()));
                    }, child: Text('Esqueci minha senha!')),
              ),
              SizedBox(height: 40),
              Container(
                height: 60,
                alignment: Alignment.center,
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
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () async => {
                      log = await Login().main(txtnome.text, txtsenha.text),
                      print(log),
                      if (log == true)
                        {
                          print("ok"),
                          Navigator.push(
                              context,

                              //mensagem de inicio
                              MaterialPageRoute(
                                builder: (context) => AlertDialog(
                                  title: Text('Bem vindo!'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Agradecemos pela participação em nosso projeto, espero que goste do nosso app',
                                            style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Text(
                                            'Esse aplicativo foi desenvolvido com a ideia de que os alunos dos cursos de engenharia pudessem compartilhar links de vídeos ou materiais de apoio', textAlign: TextAlign.center,),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Text(
                                            'Pedimos que após o teste, faça a pesquisa de opnião, acessando o menu superior, e clicando em pesquisa', textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Lista(usu: txtnome.text),
                                              ));
                                        },
                                        child: Text('Continuar',
                                            style: TextStyle(fontSize: 20))),
                                  ],
                                ),
                              )),
                          //   MaterialPageRoute(
                          //     builder: (context) => Lista(usu: txtnome.text),
                          //   ),
                          // ),
                        }
                      else
                        {
                          print('nok'),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mensagem(),
                            ),
                          ),
                        }
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
