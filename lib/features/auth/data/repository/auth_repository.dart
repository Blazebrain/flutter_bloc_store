import 'package:flutter_bloc_store/features/auth/data/models/user_model.dart';
import 'package:flutter_bloc_store/features/auth/data/providers/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuthProvider? _firebaseAuthProvider;
  AuthenticationRepository({
    required FirebaseAuthProvider provider,
  }) : _firebaseAuthProvider = provider;

  Stream<UserModel> get user => _firebaseAuthProvider!.user;

  UserModel get getCurrentUser => _firebaseAuthProvider!.currentUser;

  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuthProvider!.signUp(email: email, password: password);
  }

  Future<void> loginWithGoogle() async {
    await _firebaseAuthProvider!.loginWithGoogle();
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuthProvider!.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _firebaseAuthProvider!.logOut();
  }
}
