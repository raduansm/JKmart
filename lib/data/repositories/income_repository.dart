import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:jkmart/core/error/failures.dart';
import 'package:jkmart/core/network/network_info.dart';
import 'package:jkmart/data/datasources/income_datasource.dart';
import 'package:jkmart/data/models/income_model.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';

class IncomeRepository {
  final IncomeDataSource dataSource;
  final NetworkInfo networkInfo;

  IncomeRepository({required this.dataSource, required this.networkInfo});

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

  Future<Either<Failure, List<PaymentTypeModel>>> getPaymentTypes() async {
    if (await networkInfo.isConnected) {
      try {
        final paymentTypes = await dataSource.getPaymentTypes();
        return Right(paymentTypes);
      } on AppwriteException catch (e) {
        print(e.message);
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  Future<Either<Failure, void>> addIncome({required String vendor, required String date, required String amount}) async {
    if (await networkInfo.isConnected) {
      try {
        await dataSource.addIncome(vendor: vendor, date: date, amount: amount);

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
