import 'package:appwrite/appwrite.dart';
import 'package:jkmart/data/models/order_model.dart';
import 'package:jkmart/data/models/product_model.dart';

class OrderDataSource {
  final Databases db;
  final Client client;

  OrderDataSource({required this.db, required this.client});

  final _collectionId = '636de31ef14effad2595';
  final _productCollectionId = '6414c0e2455a906376b7';
  final _uniqueId = 'unique()';

  Future<List<OrderModel>> getOrders({
    String? vendorQuery,
    String? dateQuery,
    String? paymentTypeQuery,
  }) async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final lotteries = List<OrderModel>.from(response.documents.map((e) => OrderModel.fromJson(e.data)));

    return lotteries;
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await db.listDocuments(collectionId: _productCollectionId);

    final List<ProductModel> games = List<ProductModel>.from(response.documents.map((e) => ProductModel.fromJson(e.data)));

    return games;
  }
}
