import 'package:flutter/material.dart';
import 'package:world_capitals/app/inject_dependencies.dart';
import 'app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/data/data_source/remote/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  injectDependencies();
  runApp(const MyApp());
}
