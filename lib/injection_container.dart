import 'package:appwrite/appwrite.dart';
import 'package:dart_appwrite/dart_appwrite.dart' as aws;

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/auth_datasource.dart';
import 'package:jkmart/data/datasources/expense_datasource.dart';
import 'package:jkmart/data/datasources/income_datasource.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/repositories/auth_repository.dart';
import 'package:jkmart/data/repositories/expense_repository.dart';
import 'package:jkmart/data/repositories/income_repository.dart';
import 'package:jkmart/data/repositories/lottery_repository.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //*Repositories
  sl.registerLazySingleton<LotteryRepository>(() => LotteryRepository(dataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(dataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<IncomeRepository>(() => IncomeRepository(dataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ExpenseRepository>(() => ExpenseRepository(dataSource: sl(), networkInfo: sl()));

  //*Data Sources
  sl.registerLazySingleton<LotteryDataSource>(() => LotteryDataSource(db: sl(), client: sl()));
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource(account: sl(), users: sl()));
  sl.registerLazySingleton<IncomeDataSource>(() => IncomeDataSource(db: sl(), client: sl()));
  sl.registerLazySingleton<ExpenseDataSource>(() => ExpenseDataSource(db: sl(), client: sl()));

  //*Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //*Intialize

  final client = Client()
      .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
      .setProject('62dc48a91676c0ff925a') // Your project ID
      .setSelfSigned(status: true); // Remove in production

  final db = Databases(client, databaseId: '62dc4ad195fe6c0fe8c5');

  final account = Account(client);

  final users = aws.Users(aws.Client()
      .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
      .setProject('62dc48a91676c0ff925a') // Your project ID
      .setKey("208a2bb1618663d963649bf2db2b1d8e2e751e4bb0ef9a25b7b063ef1abf854144ce31d83f2e4f960ac1a529115e8a2dc38d68147f72e9651258db6d96a901fdbf3343ba6cdd9d58a775407440ae17ef8076af05238713822c2072d16a37cb75f6afecd7189fb56e5aa18709b57298b292e8a5d38e6956ba2c162112be961839") //Project api key with all access
      .setSelfSigned(status: true));

  //*External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => client);
  sl.registerLazySingleton(() => db);
  sl.registerLazySingleton(() => account);
  sl.registerLazySingleton(() => users);
}
