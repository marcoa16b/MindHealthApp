
import 'package:cloud_firestore/cloud_firestore.dart';

/**
 * Aquí podemos agregar todos los metodos para la base de datos y autenticación
 * podriamos crear una clase que tenga métodos para las validaciones y agregar o
 * actualizar los datos.
**/

/// Este es el ejemplo de como usar la base de datos, es lo que hice para agregar
/// los datos de los embeddings.
Future<void> addEmbedding() async {
  CollectionReference collection = FirebaseFirestore.instance.collection("test");

  /// Crear el embedding
  Map<String, dynamic> doc = {
    "name": "Kahawa coffee beans",
    "description": "Information about the Kahawa coffee beans.",
    "embedding_field": [1.0, 2.0, 3.0], /// Lista de números representando el embedding
  };

  /// Guardar el embedding en la coleccion "test"
  await collection.add(doc);
}