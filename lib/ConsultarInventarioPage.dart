import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iue_technology_inventory/AdminPage.dart';
import 'package:iue_technology_inventory/LoginPage.dart';

class ConsultarInventarioPage extends StatefulWidget {

  @override
  State createState() {
    return _ConsultarInventarioPage();
  }
}

class _ConsultarInventarioPage extends State<ConsultarInventarioPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        leading: BackButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
          },
        ),
        backgroundColor: Colors.orange,
        actions: [
          InkWell(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.exit_to_app),
            ),
          )],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Consultar(),
      ),
    );
  }
}

class Consultar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> users = [
      {'Referencia': '    SD4RF', 'Descripción': '   Mouse', 'Estado': '    Bueno', 'Observación': '+ info'},
      {'Referencia': '    SDE46', 'Descripción': '   Teclado', 'Estado': '  Malo', 'Observación': ' + info'},
      {'Referencia': '    SW98D', 'Descripción': '  Monitor', 'Estado': ' Bueno', 'Observación': '+ info'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Título de la cuadrícula
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Inventarios',
            style: TextStyle(fontSize: 40, color: Color(0xFFEC891B)),
          ),
        ),
        SizedBox(height: 30),
        // Encabezado de la cuadrícula
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Referencia', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Descripción', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Estado', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Observación', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 10),
        // Lista de usuarios
        Expanded(
          child: ListView(
            children: users.map((user) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user['Referencia']!, style: TextStyle(fontSize: 16)),
                  Text(user['Descripción']!, style: TextStyle(fontSize: 16)),
                  Text(user['Estado']!, style: TextStyle(fontSize: 16)),
                  Text(user['Observación']!, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 23),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
