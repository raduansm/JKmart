import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/exceptions.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/order_datasource.dart';
import 'package:jkmart/data/models/income_model.dart';
import 'package:jkmart/data/models/order_model.dart';
import 'package:jkmart/data/models/product_model.dart';

class OrderRepository {
  final OrderDataSource dataSource;
  final NetworkInfo networkInfo;

  OrderRepository({required this.dataSource, required this.networkInfo});

  // Future<Either<Failure, List<OrderModel>>> getOrders(
  //     {String? vendorQuery,
  //     String? dateQuery,
  //     String? paymentTypeQuery}) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final orders = await dataSource.getOrders(
  //           vendorQuery: vendorQuery,
  //           dateQuery: dateQuery,
  //           paymentTypeQuery: paymentTypeQuery);
  //       return Right(orders);
  //     } on AppwriteException catch (e) {
  //       print(e.message);
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }

  Future<Either<Failure, List<OrderModel>>> getOrders({
    String? vendorQuery,
    String? dateQuery,
    String? paymentTypeQuery,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final orders = await dataSource.getOrders(
          vendorQuery: vendorQuery,
          dateQuery: dateQuery,
          paymentTypeQuery: paymentTypeQuery,
        );
        return Right(orders);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  // Future<Either<Failure, List<OrderModel>>> getOrders() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final orders = await dataSource.getOrders();
  //       return Right(orders);
  //     } on AppwriteException catch (e) {
  //       print(e.message);
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }

  //   Future<void> getProducts() async {
  //   final result = await repository.getProducts();

  //   result.fold(
  //     (l) {
  //       if (l is NoConnectionFailure) {
  //         Get.snackbar(
  //             "No connection", "Please check your internet connection");
  //       } else {
  //         Get.snackbar("Something went wrong", "Please try again later");
  //       }
  //     },
  //     (r) {
  //       products = r;
  //       lotteryPrices.clear();
  //       totalSoldPrice = 0;
  //       for (final LotteryModel lottery in lotteries) {
  //         for (final GamesModel game in games) {
  //           if (lottery.gameId == game.gameId) {
  //             lotteryPrices.add(game.costOfTicket ?? 0);
  //             totalSoldPrice +=
  //                 (game.costOfTicket ?? 0) * (int.parse(lottery.total ?? "0"));
  //           }
  //         }
  //       }
  //     },
  //   );

  //   isLoading.value = false;
  // }

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await dataSource.getProducts();

        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
