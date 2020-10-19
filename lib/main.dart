import 'package:flutter/material.dart';
import 'HomePage.dart';

void main()  {
  runApp(MyApp());
  // var db = Firestore.instance;

  // QuerySnapshot resultado = await db.collection('usuarios').getDocuments();

  // resultado.documents.forEach((element) {
  //   print(element.data);
  // });
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      
    );
  }
}
