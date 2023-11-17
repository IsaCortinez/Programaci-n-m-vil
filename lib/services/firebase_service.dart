import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


//Funcion que retorna una lista
Future<List>gteRoles()async{
  List Roles = [];
  //Llamado a la BD a la collection de Rol
  CollectionReference collectionReferenceRol = db.collection('Rol');

  //Llamado de los datos de acuerdo a la collection anterior
  QuerySnapshot queryRol = await collectionReferenceRol.get();

  queryRol.docs.forEach((documento) {
    Roles.add(documento.data());
  });

  return Roles;
}