import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:world_capitals/app/ui/global_controllers/session_controller.dart';
import '../../../../domain/inputs/sign_in.dart';
import '../../../../domain/repository/authentication_repository.dart';

class LoginController extends SimpleNotifier{
  final SessionController _sessionController;
  String _email = '', _password = '';
  final GlobalKey<FormState> formKey = GlobalKey();
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  LoginController(this._sessionController);

  void onEmailChanged(String text){
    _email = text;
  }

  void onPasswordChanged(String text){
    _password = text;
  }

  Future<SignInResponse> submit() async{
    final response = await _authenticationRepository.signInWithEmailAndPassword(_email, _password);

    if(response.error == null){
      _sessionController.setUser(response.user!);
    }

    return response;
  }
}