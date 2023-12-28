import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/domain/models/image_breeds_model.dart';

class BreedState {
  final List<Breed> breed;
  final List<Breed> searchResults;
  final ImageBreedsModel? imageBreedsModel;
  final bool isLoading;
  final Failure? error;

  BreedState({
    this.breed = const [],
    this.searchResults = const [],
    this.isLoading = false,
    this.error,
    this.imageBreedsModel,
  });

  BreedState copyWith({
    List<Breed>? breed,
    List<Breed>? searchResults,
    ImageBreedsModel? imageBreedsModel,
    bool? isLoading,
    Failure? error,
  }) {
    return BreedState(
      breed: breed ?? this.breed,
      searchResults: searchResults ?? this.searchResults,
      imageBreedsModel: imageBreedsModel ?? this.imageBreedsModel,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
