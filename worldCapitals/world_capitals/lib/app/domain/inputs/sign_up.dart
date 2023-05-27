import 'package:firebase_auth/firebase_auth.dart';

class SignUpData {
  final String name, email, password;

  SignUpData({required this.name, required this.email, required this.password});
}

class SignUpResponse {
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}

parseStringToSignUpError(String text) {
  switch (text) {
    case "email-already-in-use":
      return SignUpError.emailAlreadyInUse;
    case "weak-password":
      return SignUpError.weakPassword;
    case "network-request-failed":
      return SignUpError.networkRequestFailed;
    case "too-many-request":
      return SignUpError.tooManyRequest;
    default:
      return SignUpError.unknown;
  }
}

enum SignUpError {
  emailAlreadyInUse,
  weakPassword,
  networkRequestFailed,
  tooManyRequest,
  unknown,
}
