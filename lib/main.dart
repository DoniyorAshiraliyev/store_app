import 'package:flutter/material.dart';
import 'package:store_app/app.dart';
import 'package:store_app/core/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}



