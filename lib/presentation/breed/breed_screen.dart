import 'package:doggo_pedia/presentation/breed/component/breed_component.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedScreen extends StatefulWidget {
  const BreedScreen({super.key});

  @override
  State<BreedScreen> createState() => _BreedScreenState();
}

class _BreedScreenState extends State<BreedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedCubit(),
      child: const BreedComponent(),
    );
  }
}
