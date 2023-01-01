import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/exceptions.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/screens/lottery/model/lottery_model.dart';

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
}
