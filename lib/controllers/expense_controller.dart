import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jkmart/data/models/expense_model.dart';

class ExpenseController extends GetxController {
  final String collectionId = "634f40a9c1be74eb6ae6";
  final String databaseId = "62dc4ad195fe6c0fe8c5";
  Client client = Client();
  Databases? db;
  String? _error;
  String? get error => _error;
  ExpenseState() {
    _init();
  }

  _init() async {
    client
        .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
        .setProject('62dc48a91676c0ff925a') // Your project ID
        .setSelfSigned(); // Remove in production
    db = Databases(client, databaseId: databaseId);
  }

  Future<List<ExpenseModel>> getIncomes() async {
    List<ExpenseModel> ExpenseList = [];
    try {
      DocumentList res = await db!.listDocuments(collectionId: collectionId);

      // if (res.statuscode != 200) {}
      for (var i = 0; i < res.documents.length; i++) {
        ExpenseList.add(ExpenseModel.fromJson(res.documents[i].data));
      }
      return ExpenseList;
    } on AppwriteException catch (e) {
      _error = e.message;
      print(e.message);
      return [];
    }
  }
}
