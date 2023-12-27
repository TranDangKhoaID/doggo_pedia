import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/domain/models/breed.dart';

class BreedState {
  final List<Breed> breed;
  final bool isLoading;
  final Failure? error;

  BreedState({
    this.breed = const [],
    this.isLoading = false,
    this.error,
  });

  BreedState copyWith({
    List<Breed>? breed,
    bool? isLoading,
    Failure? error,
  }) {
    return BreedState(
      breed: breed ?? this.breed,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
