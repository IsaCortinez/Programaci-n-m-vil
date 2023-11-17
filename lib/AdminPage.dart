import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iue_technology_inventory/ConsultarInventarioPage.dart';
import 'package:iue_technology_inventory/EnterInventory.dart';
import 'package:iue_technology_inventory/LoginPage.dart';
import 'package:iue_technology_inventory/UsuariosPage.dart';


class AdminPage extends StatefulWidget {

  @override
  State createState() {
    return _AdminPageState();
  }
}

class _AdminPageState extends State<AdminPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child:
              Text("",style: TextStyle(color: Colors.black87, fontSize: 50),),
            ),
          ),
          SizedBox(height: 16),
          butonGestionarUsuarios(),
          SizedBox(height: 16),
          butonIngresarInventario(),
          SizedBox(height: 16),
          butonControlDeInventario(),
          SizedBox(height: 45),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:Image(
                alignment: Alignment.bottomCenter,
                height: 100,
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/images/10.-IUE.png")
            ),
          ),
        ],
      ),
    );
  }


  Widget butonGestionarUsuarios(){
    return FractionallySizedBox(
      widthFactor: 0.8,
      child:
      ElevatedButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UsuariosPage()));
        },
        child: Center
          (
          child: Text("Gestionar Usuarios", style: TextStyle(color: Colors.orange, fontSize: 25  ),),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold),
            minimumSize: Size(5, 100),
            side: const BorderSide(
              width: 3.0,
              color: Colors.orange,
            ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
        ),
        ),
      ),

    );

  }

  Widget butonIngresarInventario(){
    return FractionallySizedBox(
        widthFactor: 0.8,
        child:
      ElevatedButton(
        onPressed: () async {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => EnterInventory()),
                  (Route<dynamic> route) => false);
        },
        child: Center
          (
          child:
          Text("Ingresar Inventario", style: TextStyle(color: Colors.orange, fontSize: 25  ),),
        ),
        style: ElevatedButton.styleFrom(

            primary: Colors.white,
            padding: const EdgeInsets.all(20),
            textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold),
            minimumSize: Size(5, 100),
            side: const BorderSide(
              width: 3.0,
              color: Colors.orange,
            ),
            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        ),
      ),
    );

  }

  Widget butonControlDeInventario(){
    return FractionallySizedBox(
      widthFactor: 0.8,
      child:
      ElevatedButton(
        onPressed: () async {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ConsultarInventarioPage()),
                  (Route<dynamic> route) => false);
        },
        child: Center
          (
          child: Text("Consultar Inventario", style: TextStyle(color: Colors.orange, fontSize: 25  ),),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold),
            minimumSize: Size(5, 100),
            side: const BorderSide(
              width: 3.0,
              color: Colors.orange,
            ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}