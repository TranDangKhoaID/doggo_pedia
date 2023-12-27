import 'package:doggo_pedia/app/app.dart';
import 'package:doggo_pedia/app/config/flavor.dart';
import 'package:doggo_pedia/app/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  setFlavorDevelopment();
  await DependencyInjection.init();
  runApp(const App());
}
