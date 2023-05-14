import 'package:cats_facts/repositories/cat_info_service.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  late CatInfoApiService _catInfoApiService;

  CatInfoApiService get catInfoApiService => _catInfoApiService;

  DioClient(this._dio) {
    _catInfoApiService = CatInfoApiService(_dio);
  }
}
