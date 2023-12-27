import 'package:doggo_pedia/data/network/core_rest_service.dart';
import 'package:doggo_pedia/data/network/dio/error_handler.dart';
import 'package:doggo_pedia/data/network/dio/failure.dart';
import 'package:doggo_pedia/data/response/breeds_response.dart';
import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

abstract class BreedRepository {
  Future<Either<Failure, List<Breed>>> getAllBreed({
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
        options: null,
      );
      final breeds =
          response.map<Breed>((breedData) => breedData.toDomain()).toList();
      return Right(breeds);
    } catch (e) {
      print('Lỗi: ' + e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
