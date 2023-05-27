import 'package:flutter_meedu/meedu.dart';
import 'package:world_capitals/app/domain/inputs/reset.dart';

import '../../../../domain/repository/authentication_repository.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = '';

  String get email => _email;

  final _authenticationRepository = Get.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<ResetPasswordResponse> submit(){
    return _authenticationRepository.sendResetPasswordLink(email);
  }
}
