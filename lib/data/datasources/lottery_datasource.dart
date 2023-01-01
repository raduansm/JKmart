import 'package:appwrite/appwrite.dart';
import 'package:jkmart/screens/lottery/model/lottery_model.dart';

class LotteryDataSource {
  final Databases db;

  LotteryDataSource({required this.db});

  final _collectionId = '634f40a9c1be74eb6ae6';

  Future<List<LotteryModel>> getLotteries() async {
    final response = await db.listDocuments(collectionId: _collectionId);

    final lotteries = List<LotteryModel>.from(response.documents.map((e) => LotteryModel.fromJson(e.data)));

    return lotteries;
  }
}
