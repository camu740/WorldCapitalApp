import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceGoogle {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? get user {
    return auth.currentUser;
  }

  Future<User?> loginUsingGoogle({required BuildContext context}) async {
    try {
      final GoogleSignInAccount googleUser = (await googleSignIn.signIn())!;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user!.uid == auth.currentUser!.uid) return user;
    } catch (e) {
      print('Error al iniciar sesión con google.');
    }
    return null;
  }

  Future<void> logoutUsingGoogle(BuildContext context) async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
    } catch (e) {
      print('Error al hacer logout');
    }
  }
}
