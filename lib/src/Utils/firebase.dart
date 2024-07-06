import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Aquí podemos agregar todos los metodos para la base de datos y autenticación
 * podriamos crear una clase que tenga métodos para las validaciones y agregar o
 * actualizar los datos.
**/

/// Este es el ejemplo de como usar la base de datos, es lo que hice para agregar
/// los datos de los embeddings.
class MyAppUser {
  final String uid;
  final String email;
  final String password; // En un entorno real, se almacenaría de manera segura, por ejemplo, utilizando hash y sal

  MyAppUser({
    required this.uid,
    required this.email,
    required this.password,
  });
}

class DatabaseService {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  Future<void> addEmbedding() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection("test");

    /// Crear el embedding
    Map<String, dynamic> doc = {
      "name": "Kahawa coffee beans",
      "description": "Information about the Kahawa coffee beans.",
      "embedding_field": [1.0, 2.0, 3.0],

      /// Lista de números representando el embedding
    };

    /// Guardar el embedding en la coleccion "test"
    await collection.add(doc);
  }
  ///  Método para verificar y autenticar un usuario por email y contraseña
  Future<MyAppUser?> signInWithEmail(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await _usersCollection.where('email', isEqualTo: email).limit(1).get();
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        if (userData is Map<String, dynamic> && userData['password'] == password) {
          return MyAppUser(
            uid: querySnapshot.docs.first.id,
            email: userData['email'],
            password: userData['password'],
          );
        }
      }
      return null; // Devuelve null si el usuario no existe o la contraseña es incorrecta
    } catch (e) {
      print('Error al iniciar sesión: $e');
      return null;
    }
  }


}
