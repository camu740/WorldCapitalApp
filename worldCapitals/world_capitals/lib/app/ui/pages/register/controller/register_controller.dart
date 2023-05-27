import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:world_capitals/app/domain/inputs/sign_up.dart';
import 'package:world_capitals/app/domain/repository/sign_up_repository.dart';
import 'package:world_capitals/app/ui/pages/register/controller/register_state.dart';

import '../../../global_controllers/session_controller.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this._sessionControler)
      : super(RegisterState.initialState);

  final SessionController _sessionControler;
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.find<SignUpRepository>();

  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
        name: state.name,
        email: state.email,
        password: state.password,
      ),
    );
    if(response.error == null){
      _sessionControler.setUser(response.user!);
    }
    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}
