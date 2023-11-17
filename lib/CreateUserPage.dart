import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget{


  @override
  State createState(){
    return _CreateUserState();
  }
}

class _CreateUserState extends State<CreateUserPage>{

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
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Crear Usuario",style: TextStyle(color: Color(0xFFEC891B), fontSize: 36),),
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
          butonCrearUsuario(),
          SizedBox(height: 100,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:Image(
                alignment: Alignment.bottomCenter,
                height: 80,
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/images/10.-IUE.png")
              ),
          ),
        ],
      ),
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
        labelText: "E-mail",
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8),
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
        labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(8),
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

  Widget butonCrearUsuario(){
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: ElevatedButton(
        onPressed: () async {
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
            UserCredential? credenciales = await crear(email, password);
            if(credenciales != null){
              if(credenciales.user != null){
                await credenciales.user!.sendEmailVerification();
                Navigator.of(context).pop();
              }
            }
          }
        },
        child: Text("Guardar"),
          style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
      ),
      ),
    );

  }

  Future<UserCredential?> crear(String email, String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
          password: password);
    } on FirebaseAuthException catch(e){
      if(e.code == 'email-already-in-use'){
        //todo correo en uso
        setState(() {
          error = "El correo ya se encuentra en uso";
        });
      }
      if(e.code == 'weak-password'){
        //Toda contrasenna muy debil
        setState(() {
          error="Contraseña debil";
        });
      }
    }
  }

}