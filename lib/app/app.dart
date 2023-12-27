import 'package:doggo_pedia/presentation/breed/breed_screen.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_cubit.dart';
import 'package:doggo_pedia/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScreen();
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doggo Pedia',
      debugShowCheckedModeBanner: false,
      home: BreedScreen(),
    );
  }
}
