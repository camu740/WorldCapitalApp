import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:world_capitals/app/ui/pages/splash/splash_controller.dart';

import '../../global_controllers/session_controller.dart';

final splashProvider = SimpleProvider((_) => SplashController(sessionProvider.read),);

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (_, controller) {
          final routeName = controller.routeName;
          if(routeName != null){
            router.pushReplacementNamed(routeName);
          }
        },
        builder: (_, __) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
