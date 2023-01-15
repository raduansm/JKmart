import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/exceptions.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/models/games_model.dart';
import 'package:jkmart/data/models/lottery_model.dart';

class LotteryRepository {
  final LotteryDataSource dataSource;
  final NetworkInfo networkInfo;

  LotteryRepository({required this.dataSource, required this.networkInfo});

  Future<Either<Failure, List<LotteryModel>>> getLotteries({DateTime? queryDate}) async {
    if (await networkInfo.isConnected) {
      try {
        final lotteries = await dataSource.getLotteries(queryDate: queryDate);
        return Right(lotteries);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> addLottery({required String serial, required String start, required String close, required String total, required int gameId, required DateTime date}) async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.addLottery(serial: serial, start: start, close: close, total: total, gameId: gameId, date: date);

        return const Right(null);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, List<GamesModel>>> getGames() async {
    if (await networkInfo.isConnected) {
      try {
        final games = await dataSource.getGames();

        return Right(games);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
