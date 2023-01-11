import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:jkmart/data/models/income_model.dart';

class IncomeDataSource {
  final Databases db;
  final Client client;

  IncomeDataSource({required this.db, required this.client});

  final _collectionId = '636de2f5ab93330faeed';
  final _uniqueId = 'unique()';

  Future<List<IncomeModel>> getIncomes() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final incomes = List<IncomeModel>.from(
        response.documents.map((e) => IncomeModel.fromJson(e.data)));

    return incomes;
  }

  Future<void> addIncome(
      {required String vendor,
      required String amount,
      required String date}) async {
    final IncomeModel payload = IncomeModel(
      vendor: vendor,
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
