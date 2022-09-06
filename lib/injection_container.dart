import 'dart:io';

import 'package:chopper/chopper.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/core/network/rest_client_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //Repositories
  // sl.registerLazySingleton<SignInRepository>(() => SignInRepository(networkInfo: sl(), remoteDataSource: sl()));

  //Data Sources
  // sl.registerLazySingleton<SignInRemoteDataSource>(() => SignInRemoteDataSource(auth: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Intialize

  final client = ChopperClient(
    interceptors: [
      CurlInterceptor(),
      HttpLoggingInterceptor(),
    ],
  );

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  sl.registerLazySingleton(() => RestClientService.create(client));
}
