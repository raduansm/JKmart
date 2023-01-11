import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/income_datasource.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/models/income_model.dart';

class OrderRepository {
  final IncomeDataSource dataSource;
  final NetworkInfo networkInfo;

  OrderRepository({required this.dataSource, required this.networkInfo});

  Future<Either<Failure, List<IncomeModel>>> getIncomes() async {
    if (await networkInfo.isConnected) {
      try {
        final incomes = await dataSource.getIncomes();
        return Right(incomes);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
