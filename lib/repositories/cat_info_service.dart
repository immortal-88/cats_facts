import 'package:cats_facts/constants/constants.dart';
import 'package:cats_facts/models/cat_fact_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_info_service.g.dart';

@RestApi(baseUrl: Constants.catFactUrl)
abstract class CatInfoApiService {
  factory CatInfoApiService(Dio dio, {String baseUrl}) = _CatInfoApiService;

  @GET('/fact')
  Future<CatFactResponse> fetchCatInfo();
}
