import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/expense_model.dart';
import 'package:jkmart/data/models/expense_type_model.dart';
import 'package:jkmart/data/models/payment_type_model.dart';
import 'package:jkmart/data/models/vendor_model.dart';

class ExpenseDataSource {
  final Databases db;
  final Client client;

  final _vendorCollectionId = '6414bc8f3b74957e61d6';
  final _expenseTypeCollectionId = '6414be5ddca79142ef31';
  final _uniqueId = 'unique()';

  ExpenseDataSource({required this.db, required this.client});

  final _collectionId = '6362875432b3fd33c793';

  Future<List<ExpenseModel>> getExpenses({String? vendorQuery, String? dateQuery, String? expenseTypeQuery}) async {
    final response = await db.listDocuments(
      collectionId: _collectionId,
      orderTypes: ["DESC"],
      orderAttributes: ["date"],
      queries: [
        vendorQuery != null ? Query.equal("vendor", vendorQuery) : Query.notEqual("vendor", ""),
        dateQuery != null ? Query.equal("date", dateQuery) : Query.notEqual("date", ""),
        expenseTypeQuery != null ? Query.equal("type", expenseTypeQuery) : Query.notEqual("type", ""),
      ],
    );

    final expenses = List<ExpenseModel>.from(response.documents.map((e) => ExpenseModel.fromJson(e.data)));

    return expenses;
  }

  Future<List<VendorModel>> getVendors() async {
    final response = await db.listDocuments(collectionId: _vendorCollectionId);

    final vendors = List<VendorModel>.from(response.documents.map((e) => VendorModel.fromJson(e.data)));

    return vendors;
  }

  Future<List<ExpenseTypeModel>> getExpenseTypes() async {
    final response = await db.listDocuments(collectionId: _expenseTypeCollectionId);

    final expenseTypes = List<ExpenseTypeModel>.from(response.documents.map((e) => ExpenseTypeModel.fromJson(e.data)));

    return expenseTypes;
  }

  Future<void> addExpense({required String vendor, required String amount, required String date, required String type, required String expenseDetails}) async {
    final ExpenseModel payload = ExpenseModel(
      vendor: vendor,
      amount: amount,
      date: date,
      type: type,
      expenseDetails: expenseDetails,
    );

    await db.createDocument(collectionId: _collectionId, documentId: _uniqueId, data: payload.toJson());
  }
}
