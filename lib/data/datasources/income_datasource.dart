import 'package:appwrite/appwrite.dart';
import 'package:jkmart/screens/income/model/income_model.dart';

class IncomeDataSource {
  final Databases db;

  IncomeDataSource({required this.db});

  final _collectionId = '636de2f5ab93330faeed';

  Future<List<IncomeModel>> getIncomes() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final incomes = List<IncomeModel>.from(
        response.documents.map((e) => IncomeModel.fromJson(e.data)));

    return incomes;
  }
}
