import 'package:yozil/data/data.dart';

abstract class AuthRemoteSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name);
  Future<void> logout();
  Stream<User?> authStateChanges();
  Future<User?> getCurrentUser(); // Added this method
}
