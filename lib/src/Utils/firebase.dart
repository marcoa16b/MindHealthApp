import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/**
 * Aquí podemos agregar todos los metodos para la base de datos y autenticación
 * podriamos crear una clase que tenga métodos para las validaciones y agregar o
 * actualizar los datos.
**/

/// Este es el ejemplo de como usar la base de datos, es lo que hice para agregar
/// los datos de los embeddings.
class DatabaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  /// Método para registrar un nuevo usuario usando email y contraseña
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  ///  Método para verificar y autenticar un usuario por email y contraseña
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Método para cerrar la sesión del usuario
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error: $e');
    }
  }

  /// Método para verificar si hay un usuario autenticado
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
