import 'package:appwrite/appwrite.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //*Repositories
  sl.registerLazySingleton<LotteryRepository>(() => LotteryRepository(dataSource: sl(), networkInfo: sl()));

  //*Data Sources
  sl.registerLazySingleton<LotteryDataSource>(() => LotteryDataSource(db: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Intialize

  final client = Client()
      .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
      .setProject('62dc48a91676c0ff925a') // Your project ID
      .setSelfSigned(status: true); // Remove in production

  final db = Databases(client, databaseId: '62dc4ad195fe6c0fe8c5');

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => client);
  sl.registerLazySingleton(() => db);
}
