import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:jkmart/screens/income/model/income_model.dart';

class IncomeController extends GetxController {
  final String collectionId = "634f40a9c1be74eb6ae6";
  final String databaseId = "62dc4ad195fe6c0fe8c5";
  Client client = Client();
  Databases? db;
  String? _error;
  String? get error => _error;
  IncomeState() {
    _init();
  }

  _init() async {
    client
        .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
        .setProject('62dc48a91676c0ff925a') // Your project ID
        .setSelfSigned(); // Remove in production
    db = Databases(client);
  }

  Future<List<IncomeModel>> getIncomes() async {
    List<IncomeModel> IncomeList = [];
    try {
      DocumentList res = await db!
          .listDocuments(databaseId: databaseId, collectionId: collectionId);

      if (res.statuscode != 200) {}
      for (var i = 0; i < res.documents!.length; i++) {
        IncomeList.add(IncomeModel.fromJson(res.documents[i].data));
      }
      return IncomeList;
    } on AppwriteException catch (e) {
      _error = e.message;
      print(e.message);
      return [];
    }
  }
}
