import 'dart:async';
import 'package:flutter_application_1/domain/domain.dart';

abstract class DogsRepositoryInterface {
  Future<List<Article>> getRandomDogImages();
}
