import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/exceptions.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/models/lottery_model.dart';

class LotteryRepository {
  final LotteryDataSource dataSource;
  final NetworkInfo networkInfo;

  LotteryRepository({required this.dataSource, required this.networkInfo});

  Future<Either<Failure, List<LotteryModel>>> getLotteries() async {
    if (await networkInfo.isConnected) {
      try {
        final lotteries = await dataSource.getLotteries();
        return Right(lotteries);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> addLottery({required String serial, required String start, required String close, required String total}) async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.addLottery(serial: serial, start: start, close: close, total: total);

        return const Right(null);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
