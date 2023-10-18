import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:store_app/core/apis.dart';
import 'package:store_app/core/services/dio_service.dart';
import 'package:store_app/domain/repositories/product_repository.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';


final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    networkService.configuration(Apis.baseUrl);
    return networkService;
  });




  //Repositories
  locator.registerSingleton<ProductRepository>(ProductRepositoryImpl(client: locator()));
  // Blocs
  locator.registerFactory(() => HomeBloc(locator()));
}