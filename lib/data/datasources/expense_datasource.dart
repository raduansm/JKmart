import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/expense_model.dart';

class ExpenseDataSource {
  final Databases db;
  final Client client;
  final _uniqueId = 'unique()';

  ExpenseDataSource({required this.db, required this.client});

  final _collectionId = '6362875432b3fd33c793';

  Future<List<ExpenseModel>> getExpenses() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final expenses = List<ExpenseModel>.from(
        response.documents.map((e) => ExpenseModel.fromJson(e.data)));

    return expenses;
  }

  Future<void> addExpense(
      {required String name,
      required String amount,
      required String date}) async {
    final ExpenseModel payload = ExpenseModel(
      name: name,
      amount: amount,
      date: date,
    );
    //After login function adding, this have to be removed
    //Start remove section
    Session? session;
    try {
      session = await Account(client).getSession(sessionId: 'current');
    } catch (e) {
      session = null;
    }

    if (session == null) await Account(client).createAnonymousSession();

    //End remove section

    final response = await db.createDocument(
        collectionId: _collectionId,
        documentId: _uniqueId,
        data: payload.toJson());
  }
}
