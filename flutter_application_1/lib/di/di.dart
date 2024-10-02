import 'package:flutter_application_1/domain/repository/dogs/dogs_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/app/features/home/bloc/bloc.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();
Future<void> setupLocator() async {
  setUpDio();
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton(talker);
  getIt.registerSingleton(DogsRepository(dio: getIt<Dio>()));
  getIt.registerSingleton(HomeBloc(getIt.get<DogsRepository>()));
  
}