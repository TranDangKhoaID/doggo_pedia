import 'package:doggo_pedia/app/di/get_it.dart';
import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/data/repository/breeds_repository.dart';
import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/domain/models/image_breeds_model.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedCubit extends Cubit<BreedState> {
  BreedCubit() : super(BreedState());
  final BreedRepository _breedRepository = getIt<BreedRepository>();
  Future<void> getBreed() async {
    emit(state.copyWith(isLoading: true));

    final result = await _breedRepository.getAllBreed(useCache: true);

    result.fold(
      (Failure failure) {
        emit(state.copyWith(isLoading: false, error: failure));
      },
      (List<Breed> data) {
        emit(state.copyWith(isLoading: false, breed: data, error: null));
      },
    );
  }

  Future<void> getImageOnBreeds({required String imageID}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _breedRepository.getImageBreeds(
      imageID: imageID,
      useCache: true,
    );
    result.fold(
      (Failure failure) {
        emit(state.copyWith(isLoading: false, error: failure));
      },
      (ImageBreedsModel data) {
        emit(
          state.copyWith(
            isLoading: false,
            imageBreedsModel: data,
            error: null,
          ),
        );
      },
    );
  }

  void searchBreedByName(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(searchResults: state.breed));
      return;
    }
    //
    final List<Breed> results = state.breed
        .where(
            (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(searchResults: results));
  }
}
