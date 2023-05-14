import 'package:cats_facts/app.dart';
import 'package:cats_facts/constants/constants.dart';
import 'package:cats_facts/models/cat_info.dart';
import 'package:cats_facts/repositories/cat_repository.dart';
import 'package:cats_facts/repositories/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatInfoAdapter());

  await Hive.openBox(Constants.catInfoBox);

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(create: (_) => CatRepository(client: DioClient(Dio())))
  ], child: const MyApp()));
}
