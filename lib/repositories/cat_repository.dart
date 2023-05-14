import 'package:cats_facts/models/cat_fact_response.dart';
import 'package:cats_facts/repositories/dio_client.dart';

class CatRepository {
  const CatRepository({
    required this.client,
  });

  final DioClient client;

  Future<CatFactResponse> getCatInfo() async =>
      client.catInfoApiService.fetchCatInfo();
}
