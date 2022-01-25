import 'package:dellioo/core/services/api/http_client.dart';
import 'package:dellioo/core/services/location/location_service.dart';
import 'package:dellioo/core/services/location/location_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerFactory(() => HttpHelper());

  locator.registerLazySingleton<LocationService>(
        () => LocationServiceImpl(
      httpHelper: locator.get(),
    ),
  );
}