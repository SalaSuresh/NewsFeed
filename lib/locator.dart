import 'package:get_it/get_it.dart';
import 'package:news_feed/service/api_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
}
