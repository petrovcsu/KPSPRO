import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/data.dart';  
import 'package:flutter_application_1/domain/domain.dart'; 

class DogsRepository extends DogsRepositoryInterface {
  DogsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<Article>> getRandomDogImages() async {
    try {
      final response = await dio.get(
        Endpoints.randomDogImages,
        queryParameters: {
          'limit': 10,
          'has_breeds': 1, //Параметр только с породами
          'api_key': 'live_AlthxqW6D5l34dYsr0xLfSwEtQOWeqOPXp5gS3xDh6qW15kOsT69uZZyZJcio56C',  //API-ключ
        },
      );

      final List<dynamic> imageList = response.data;
      final List<Article> articles = imageList.map((json) => Article.fromJson(json)).toList();
      return articles;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
