import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iue_technology_inventory/AdminPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iue_technology_inventory/LoginPage.dart';


class EnterInventory extends StatefulWidget {

  @override
  State createState() {
    return _EnterInventoryState();
  }
}
class _EnterInventoryState extends State<EnterInventory> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Control de Inventario',
                      style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFFEC891B),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.centerLeft, // Alinea los elementos internos al inicio (izquierda)
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos internos al inicio (izquierda)
                        children: [
                          Text(
                            'Acciones:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? photo = await picker.pickImage(source: ImageSource.camera);
                              if (photo != null) {
                                // Aquí puedes manejar la imagen capturada, como guardarla o mostrarla
                                print('Ruta de la imagen: ${photo.path}');
                              }
                            },
                            child: Text(
                              '📷',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Puedes cambiar el color según tu preferencia
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '#Equipo:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingrese el número de equipo',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nombre:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingrese el nombre',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Estado:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingrese el estado',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Observaciones:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingrese observaciones',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Agrega aquí la lógica para guardar el inventario
                      },
                      child: Text(
                        'Guardar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEC891B),
                      ),
                    ),

                    Image.asset(
                      'assets/images/10.-IUE.png',
                      height: 50, // Ajusta la altura según tus necesidades
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}