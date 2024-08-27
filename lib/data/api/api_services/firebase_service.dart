import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreService {
  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  // Create or Update a document
  static Future<void> setDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await fireStore
          .collection(collectionPath)
          .doc(documentId)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to set document: $e');
    }
  }

  // Get a document
  static Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      DocumentSnapshot snapshot =
          await fireStore.collection(collectionPath).doc(documentId).get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      throw Exception('Failed to get document: $e');
    }
  }

  // Delete a document
  static Future<void> deleteDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      await fireStore.collection(collectionPath).doc(documentId).delete();
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }

  // Get a collection of documents
  static Future<List<Map<String, dynamic>>> getCollection({
    required String collectionPath,
    int limit = 10,
    Query? query,
  }) async {
    try {
      QuerySnapshot snapshot;
      if (query != null) {
        snapshot = await query.limit(limit).get();
      } else {
        snapshot =
            await fireStore.collection(collectionPath).limit(limit).get();
      }
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Exception('Failed to get collection: $e');
    }
  }

  // Add a document to a collection
  static Future<void> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      await fireStore.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }

  // Update a document
  static Future<void> updateDocument({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await fireStore.collection(collectionPath).doc(documentId).update(data);
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  // Stream a collection of documents
  static Stream<List<Map<String, dynamic>>> streamCollection({
    required String collectionPath,
    int limit = 10,
  }) {
    try {
      return fireStore.collection(collectionPath).limit(limit).snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList(),
          );
    } catch (e) {
      throw Exception('Failed to stream collection: $e');
    }
  }

  // Stream a specific document
  static Stream<Map<String, dynamic>?> streamDocument({
    required String collectionPath,
    required String documentId,
  }) {
    try {
      return fireStore
          .collection(collectionPath)
          .doc(documentId)
          .snapshots()
          .map(
            (snapshot) => snapshot.data() as Map<String, dynamic>?,
          );
    } catch (e) {
      throw Exception('Failed to stream document: $e');
    }
  }
}
