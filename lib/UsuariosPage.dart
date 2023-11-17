import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iue_technology_inventory/LoginPage.dart';

class UsuariosPage extends StatefulWidget {

  @override
  State createState() {
    return _UsuariosPage();
  }
}

class _UsuariosPage extends State<UsuariosPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
        //border: Border.all(color: Colors.black), // Configuración del borde
        //borderRadius: BorderRadius.circular(8.0), // Opcional: bordes redondeados
        ),
      child: Usuarios(),
      ),

    );
  }
}

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> users = [
      {'Cedula': '1058695787', 'Nombres': 'Maria Isabel', 'Apellidos': 'Cortinez Bedoya', 'Rol': 'Admin'},
      {'Cedula': '42556856', 'Nombres': 'Juan Pablo', 'Apellidos': 'Cardona Cardona', 'Rol': 'User'},
      // ... Agrega más usuarios según sea necesario
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Título de la cuadrícula
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Usuarios',
            style: TextStyle(fontSize: 40, color: Color(0xFFEC891B), ),
          ),
        ),
        SizedBox(height: 50),
        // Encabezado de la cuadrícula
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cedula', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text('Nombres', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text('Apellidos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text('Rol', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        // Lista de usuarios
        ...users.map((user) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(user['Cedula']!, style: TextStyle(fontSize: 15),),
              Text(user['Nombres']!, style: TextStyle(fontSize: 15),),
              Text(user['Apellidos']!, style: TextStyle(fontSize: 15),),
              Text(user['Rol']!, style: TextStyle(fontSize: 15),),
            ],
          );
        }).toList(),
      ],
    );
  }
}
