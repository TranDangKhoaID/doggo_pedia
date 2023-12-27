import 'package:doggo_pedia/presentation/breed/cubit/breed_cubit.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedComponent extends StatefulWidget {
  const BreedComponent({super.key});

  @override
  State<BreedComponent> createState() => _BreedComponentState();
}

class _BreedComponentState extends State<BreedComponent> {
  @override
  void initState() {
    context.read<BreedCubit>().getBreed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedCubit, BreedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Breed List'),
          ),
          body: Center(
            child: state.isLoading
                ? const CircularProgressIndicator()
                : state.breed.isEmpty
                    ? const Text('No breeds available.')
                    : breedValueItem(state),
          ),
        );
      },
    );
  }

  Widget breedValueItem(BreedState state) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: state.breed.length,
        itemBuilder: (context, index) {
          final breed = state.breed[index];
          return Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              breed.name,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
