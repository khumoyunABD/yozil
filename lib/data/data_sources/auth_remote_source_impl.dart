import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:yozil/core/core.dart';
import 'package:yozil/data/data.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  AuthRemoteSourceImpl(
    this._firebaseAuth,
    this._firestore,
  );

  final firebase.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  @override
  Future<User?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;

    try {
      final userDoc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();

      if (!userDoc.exists) return null;
      return User.fromJson(userDoc.data()!);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc =
          await _firestore.collection('users').doc(credential.user?.uid).get();

      return User.fromJson(userDoc.data()!);
    } on firebase.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          throw InvalidCredentialsException();
        default:
          throw ServerException();
      }
    }
  }

  @override
  Future<User> register(String email, String password, String name) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = User(
        id: credential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      // Store additional user data in Firestore
      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toJson());

      return user;
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      }
      throw ServerException();
    }
  }

  @override
  Future<void> logout() => _firebaseAuth.signOut();

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) return null;

      final userDoc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();

      if (!userDoc.exists) return null;
      return User.fromJson(userDoc.data()!);
    });
  }
}
