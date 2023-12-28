import 'package:dio/dio.dart';
import 'package:doggo_pedia/data/response/breeds_response.dart';
import 'package:doggo_pedia/data/response/image_breeds_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'core_rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class CoreRestService {
  @factoryMethod
  factory CoreRestService(Dio dio) = _CoreRestService;

  @GET("/v1/breeds")
  Future<List<BreedsDataResponse>> getBreeds({
    @DioOptions() required Options? options,
  });

  @GET("/v1/images/{imageID}")
  Future<ImageBreedsResponse> getImageBreeds(
    @Path("imageID") String imageID, {
    @DioOptions() required Options? options,
  });
}
