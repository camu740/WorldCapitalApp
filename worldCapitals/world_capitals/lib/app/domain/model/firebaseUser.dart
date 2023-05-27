
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;

  set user(User? user){
    uid = user?.uid;
    name = user?.displayName;
    email = user?.email;
    imageUrl = user?.photoURL;
  }

  String? get getUid => uid;
  String? get getName => name;
  String? get getEmail => email;
  String? get getImage => imageUrl;

}