import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerLabor({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String skill,
    required String city,
    required String wage,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('labors').doc(result.user!.uid).set({
        'name': name,
        'phone': phone,
        'skill': skill,
        'city': city,
        'wage': wage,
        'email': email,
        'role': 'labor',
        'createdAt': DateTime.now().toString(),
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  /// for user role

  Future<String?> getUserRole(String uid) async {
    try {
      // Check labor
      DocumentSnapshot doc = await _firestore
          .collection('labors')
          .doc(uid)
          .get();
      if (doc.exists) return 'labor';

      // Check client
      DocumentSnapshot clientDoc = await _firestore
          .collection('clients')
          .doc(uid)
          .get();
      if (clientDoc.exists) return 'client';

      return null;
    } catch (e) {
      return null;
    }
  }
}
