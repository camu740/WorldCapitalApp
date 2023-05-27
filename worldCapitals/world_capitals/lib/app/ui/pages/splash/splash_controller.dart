import 'package:flutter_meedu/meedu.dart';
import 'package:world_capitals/app/domain/repository/authentication_repository.dart';
import 'package:world_capitals/app/ui/global_controllers/session_controller.dart';
import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;

  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if(user!=null){
      _routeName=Routes.HOME;
      _sessionController.setUser(user);
    }else{
      _routeName = Routes.LOGIN;
    }
    notify();
  }

}