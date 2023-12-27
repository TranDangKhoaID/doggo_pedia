import 'package:doggo_pedia/app/di/get_it.dart';
import 'package:flutter/material.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    await initDependencyInjection();
  }
}
