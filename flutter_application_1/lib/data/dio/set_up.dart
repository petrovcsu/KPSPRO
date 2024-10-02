import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:flutter_application_1/di/di.dart';
void setUpDio() {
 dio.options.baseUrl = 'https://api.thedogapi.com/v1/'; // общая часть адресов запросов
 dio.options.queryParameters.addAll({
  // 'live_AlthxqW6D5l34dYsr0xLfSwEtQOWeqOPXp5gS3xDh6qW15kOsT69uZZyZJcio56C': '', // сюда нужно будет подставить ключ/токен, выданный при регистрации
 });
 dio.options.connectTimeout = const Duration(minutes: 1);
 dio.options.receiveTimeout = const Duration(minutes: 1);
 dio.interceptors.addAll([
  TalkerDioLogger(
    talker: talker,
    settings: const TalkerDioLoggerSettings(
      printRequestData: true,
      printRequestHeaders: true,
    ),
  ),
 ]);
}
