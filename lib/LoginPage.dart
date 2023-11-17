import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iue_technology_inventory/AdminPage.dart';
import 'package:iue_technology_inventory/CreateUserPage.dart';


class LoginPage extends StatefulWidget{


  @override
  State createState(){
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage>{

  late String email, password;
  final _formKey = GlobalKey<FormState>();
  String error='';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              height: 100,
              filterQuality: FilterQuality.high,
              image: AssetImage("assets/images/10.-IUE.png")
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("IUE Technology Inventory",style: TextStyle(color: Colors.black87, fontSize: 20),),
          ),
          Offstage(
            offstage: error == '',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(error, style: TextStyle(color: Colors.red, fontSize: 16),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: formulario(),
          ),
          butonLogin(),
          nuevoAqui(),
          //prueba(),
        ],
      ),
    );
  }
  
  Widget nuevoAqui(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(""),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserPage()));
        },
          child: Text("Registrarse",
          style: TextStyle(color: Colors.orange, fontSize: 15),
         ),
        ),
      ],
    );
  }


  Widget formulario(){
    return Form(
      key: _formKey,
        child: Column(children: [
          buildEmail(),
            const Padding(padding: EdgeInsets.only(top:12)),
            buildPassword(),
    ],));
  }

  Widget buildEmail(){
    return Container(
        width: 300,
        height: 50,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "Correo",
          //contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          //alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(color: Colors.black)
          )
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value){
        email = value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return "Este campo es obligatorio";
        }
        return null;
      }
    ),
    );

  }

  Widget buildPassword(){
    return Container(
      width: 300,
      height: 50,
      child: TextFormField(
      decoration: InputDecoration(
        labelText: "Contraseña",
          alignLabelWithHint: true,
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10),
              borderSide: new BorderSide(color: Colors.black)
          )
      ),
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          return "Este campo es obligatorio";
        }
        return null;
      },
      onSaved: (String? value){
        password = value!;
      },
    ),

    );
  }

  Widget butonLogin(){
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: ElevatedButton(
        onPressed: () async {
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
            UserCredential? credenciales = await login(email, password);
            if(credenciales != null){
              if(credenciales.user != null){
               //if(credenciales.user!.emailVerified) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                          (Route<dynamic> route) => false);
               //}
                /*
                else{
                  //todo Mostrar al usuario que debe verificar su email
                  setState(() {
                    error = "Debes verificar tu correo antes de acceder";
                  });
                }
                */
              }
            }
          }
        },
        child:Text("INGRESAR"),
        style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            textStyle: TextStyle(
              color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Ajusta el radio según tus necesidades
      ),
        ),
      ),
    );
  }

  Future<UserCredential?> login(String email, String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
          password: password);
      return userCredential;
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        //todo usuario no encontrado
        setState(() {
          error = "Usuario no encontrado";
        });
      }
      if(e.code == 'wrong-password'){
        //Toda contrasenna incorrecto
        setState(() {
          error="Contraseña incorrecta";
        });
      }
    }
  }

}