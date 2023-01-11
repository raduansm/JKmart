import 'package:appwrite/appwrite.dart';
import 'package:jkmart/data/models/order_model.dart';

class IncomeDataSource {
  final Databases db;
  final Client client;

  IncomeDataSource({required this.db, required this.client});

  final _collectionId = '636de31ef14effad2595';

  Future<List<OrderModel>> getOrders() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final lotteries = List<OrderModel>.from(
        response.documents.map((e) => OrderModel.fromJson(e.data)));

    return lotteries;
  }
}
