import 'package:doggo_pedia/presentation/breed/cubit/breed_cubit.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_state.dart';
import 'package:doggo_pedia/presentation/detail_breed/detail_breed_screen.dart';
import 'package:doggo_pedia/presentation/manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
                ? const Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : state.breed.isEmpty
                    ? const Text('No breeds available.')
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: breedValueItem(state),
                      ),
          ),
        );
      },
    );
  }

  Widget breedValueItem(BreedState state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: state.breed.length,
      itemBuilder: (context, index) {
        final breed = state.breed[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailBreedScreen(
                  breed: breed,
                  imageID: breed.referenceImageId!,
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        breed.name.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(5),
                  Text(
                    breed.breedGroup ?? 'None',
                    textAlign: TextAlign.center,
                  ),
                  Gap(10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
