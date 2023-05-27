import 'package:firebase_auth/firebase_auth.dart';
import 'package:world_capitals/app/domain/inputs/reset.dart';

import '../inputs/sign_in.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;

  Future<void> signOut();

  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password);

  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}
