import 'package:appwrite/appwrite.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //Repositories
  // sl.registerLazySingleton<SignInRepository>(() => SignInRepository(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<LotteryRepository>(() => LotteryRepository(dataSource: sl(), networkInfo: sl()));

  //Data Sources
  // sl.registerLazySingleton<SignInRemoteDataSource>(() => SignInRemoteDataSource(auth: sl()));
  sl.registerLazySingleton<LotteryDataSource>(() => LotteryDataSource(db: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Intialize

  // final client = ChopperClient(
  //   interceptors: [
  //     CurlInterceptor(),
  //     HttpLoggingInterceptor(),
  //   ],
  // );

  final client = Client()
      .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
      .setProject('62dc48a91676c0ff925a') // Your project ID
      .setSelfSigned(status: true); // Remove in production

  final db = Databases(client, databaseId: '62dc4ad195fe6c0fe8c5');

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  // sl.registerLazySingleton(() => RestClientService.create(client));
  sl.registerLazySingleton(() => client);
  sl.registerLazySingleton(() => db);
}
