import 'package:doggo_pedia/app/storage/cache_manager.dart';
import 'package:doggo_pedia/data/network/core_rest_service.dart';
import 'package:doggo_pedia/data/network/dio/error_handler.dart';
import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/data/response/breeds_response.dart';
import 'package:doggo_pedia/data/response/image_breeds_response.dart';
import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/domain/models/image_breeds_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

abstract class BreedRepository {
  Future<Either<Failure, List<Breed>>> getAllBreed({
    bool useCache = false,
  });

  Future<Either<Failure, ImageBreedsModel>> getImageBreeds({
    required String imageID,
    bool useCache = false,
  });
}

@LazySingleton(as: BreedRepository)
class BreedsRepositoryImpl implements BreedRepository {
  final CoreRestService _restService;

  BreedsRepositoryImpl(this._restService);

  @override
  Future<Either<Failure, List<Breed>>> getAllBreed(
      {bool useCache = false}) async {
    try {
      final response = await _restService.getBreeds(
        options: useCache ? CacheManager.fiveMinuteCache : null,
      );
      final breeds =
          response.map<Breed>((breedData) => breedData.toDomain()).toList();
      return Right(breeds);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ImageBreedsModel>> getImageBreeds(
      {required String imageID, bool useCache = false}) async {
    try {
      final response = await _restService.getImageBreeds(
        options: useCache ? CacheManager.fiveMinuteCache : null,
        imageID,
      );
      return Right(response.toDomain());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
