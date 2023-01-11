// import 'package:appwrite/appwrite.dart';
// import 'package:dartz/dartz.dart';
// import 'package:jkmart/core/error/failures.dart';
// import 'package:jkmart/core/network/network_info.dart';
// import 'package:jkmart/data/datasources/expense_datasource.dart';
// import 'package:jkmart/data/models/expense_model.dart';
// import 'package:jkmart/data/models/income_model.dart';

// class ExpenseRepository {
//   final ExpenseDataSource dataSource;
//   final NetworkInfo networkInfo;

//   ExpenseRepository({required this.dataSource, required this.networkInfo});

//   Future<Either<Failure, List<ExpenseModel>>> getExpense() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final expenses = await dataSource.getExpense();
//         return Right(expenses);
//       } on AppwriteException catch (e) {
//         print(e.message);
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(NoConnectionFailure());
//     }
//   }
// }
