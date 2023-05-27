import 'package:flutter/material.dart';
import 'package:world_capitals/app/ui/routes/app_routes.dart';
import 'package:world_capitals/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldCapitals',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
      //comprobamos si cambia la ruta de pagina
      navigatorObservers: [
        router.observer,
      ],
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}