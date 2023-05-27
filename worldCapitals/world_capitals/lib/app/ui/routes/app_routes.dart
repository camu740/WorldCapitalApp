import 'package:flutter/cupertino.dart' show Widget, BuildContext;
import 'package:world_capitals/app/ui/pages/register/register_page.dart';
import 'package:world_capitals/app/ui/pages/reset_password/reset_password_page.dart';
import 'package:world_capitals/app/ui/pages/score/score_page.dart';
import 'package:world_capitals/app/ui/pages/study/study_page.dart';
import 'package:world_capitals/app/ui/routes/routes.dart';import '../pages/game/game_page.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.SPLASH: (_) => const SplashPage(),
  Routes.LOGIN: (_) => const LoginPage(),
  Routes.HOME: (_) => const HomePage(),
  Routes.GAME: (_) => const GamePage(),
  Routes.REGISTER: (_) => const RegisterPage(),
  Routes.SCORE: (_) => const ScorePage(),
  Routes.STUDY: (_) => const StudyPage(),
  Routes.RESET_PASSWORD: (_) => const ResetPasswordPage(),

};