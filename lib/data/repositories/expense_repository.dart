import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/exceptions.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/expense_datasource.dart';
import 'package:jkmart/data/datasources/lottery_datasource.dart';
import 'package:jkmart/data/models/expense_model.dart';
import 'package:jkmart/data/models/expense_type_model.dart';
import 'package:jkmart/data/models/lottery_model.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';

class ExpenseRepository {
  final ExpenseDataSource dataSource;
  final NetworkInfo networkInfo;

  ExpenseRepository({required this.dataSource, required this.networkInfo});

  Future<Either<Failure, List<ExpenseModel>>> getExpenses(
      {String? vendorQuery,
      String? dateQuery,
      String? expenseTypeQuery}) async {
    if (await networkInfo.isConnected) {
      try {
        final incomes = await dataSource.getExpenses(
            vendorQuery: vendorQuery,
            dateQuery: dateQuery,
            expenseTypeQuery: expenseTypeQuery);
        return Right(incomes);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, List<VendorModel>>> getVendors() async {
    if (await networkInfo.isConnected) {
      try {
        final vendors = await dataSource.getVendors();
        return Right(vendors);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, List<ExpenseTypeModel>>> getExpenseTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final paymentTypes = await dataSource.getExpenseTypes();
        return Right(paymentTypes);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> addExpense({
    required String vendor,
    required String amount,
    required String date,
    required String expenseDetails,
    required String type,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.addExpense(
            vendor: vendor,
            amount: amount,
            date: date,
            expenseDetails: "test",
            type: '6414be5ddca79142ef31');

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
